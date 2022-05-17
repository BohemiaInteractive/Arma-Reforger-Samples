class SCR_DrawerUserAction : ScriptedUserAction
{
	[Attribute( defvalue: "Drawer 1", uiwidget: UIWidgets.EditBox, desc: "Signal index of drawer" )]
	private string m_sSignalName;	//for pairing with the user action
	private int m_iSignalIndex;
	
	private IEntity m_Owner;
	const float MAX_SIGNAL_VALUE = 0.25;

	//! Signal manager to pass signals into proc anim
	private SignalsManagerComponent m_SignalsManager;
	//! Sound component
	private SoundComponent m_SoundComponent;

	//------------------------------------------------------------------------------------------------
	override bool CanBeShownScript(IEntity user)
	{
		return CanBePerformedScript(user);
	}

	//------------------------------------------------------------------------------------------------
	override bool CanBePerformedScript(IEntity user)
	{
		if(!m_SignalsManager)
			return false;
		
		float signalValue = m_SignalsManager.GetSignalValue(m_iSignalIndex);
		if(signalValue > 0 && signalValue < MAX_SIGNAL_VALUE*0.9) {
			return false;
		}
		
		return true;
	}

	//---------------------------------------------------------
	override void PerformAction(IEntity pOwnerEntity, IEntity pUserEntity)
	{
		GenericEntity genericUserEntity = GenericEntity.Cast(pUserEntity);
		m_iSignalIndex = m_SignalsManager.FindSignal(m_sSignalName);
		float targetValue = Math.AbsFloat((m_SignalsManager.GetSignalValue(m_iSignalIndex)) - MAX_SIGNAL_VALUE);
		
		m_SignalsManager.SetSignalValue(m_iSignalIndex, targetValue);
		// Play sound
		if (m_SoundComponent)
		{
			if(targetValue > 0)
			{
				m_SoundComponent.SoundEvent("SOUND_DRAWER_OPEN");
			}
			else
			{
				m_SoundComponent.SoundEvent("SOUND_DRAWER_CLOSE");
			}
		}
		pOwnerEntity.SetFlags(EntityFlags.ACTIVE, true);
	}

	//------------------------------------------------------------------------------------------------
	override bool GetActionNameScript(out string outName)
	{
		if((m_SignalsManager.GetSignalValue(m_iSignalIndex)) == 0)
		{
			outName = "Open";
		}else{
			outName = "Close";
		}
		return true;
	}

	//------------------------------------------------------------------------------------------------
	override void Init(IEntity pOwnerEntity, GenericComponent pManagerComponent)
	{
		m_Owner = pOwnerEntity;

		GenericEntity genericEntity = GenericEntity.Cast( m_Owner );
		if (!genericEntity)
			return;

		GenericComponent genComponent = GenericComponent.Cast(genericEntity.FindComponent(SignalsManagerComponent));
		if (!genComponent)
			return;

		m_SignalsManager = SignalsManagerComponent.Cast(genericEntity.FindComponent(SignalsManagerComponent));
		m_SoundComponent = SoundComponent.Cast(genericEntity.FindComponent(SoundComponent));
	}
}