class SCR_DrawerUserAction : ScriptedUserAction
{
	[Attribute( defvalue: "Drawer 1", uiwidget: UIWidgets.EditBox, desc: "Signal index of drawer" )]
	private string m_sSignalName;	//for pairing with the user action
	private int m_iSignalIndex = -1;
	
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
		
		if (m_iSignalIndex < 0)
		{
			m_iSignalIndex = m_SignalsManager.FindSignal(m_sSignalName);
			return false;
		}
		
		return true;
	}

	//---------------------------------------------------------
	override void PerformAction(IEntity pOwnerEntity, IEntity pUserEntity)
	{
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
	}

	//------------------------------------------------------------------------------------------------
	override bool GetActionNameScript(out string outName)
	{	
		if((m_SignalsManager.GetSignalValue(m_iSignalIndex)) == 0)
		{
			outName = "Open"; 
		} else 
		{ 
			outName = "Close";
		}
		return true;
	}

	//------------------------------------------------------------------------------------------------
	override void Init(IEntity pOwnerEntity, GenericComponent pManagerComponent)
	{
		m_SignalsManager = SignalsManagerComponent.Cast(pOwnerEntity.FindComponent(SignalsManagerComponent));
		m_SoundComponent = SoundComponent.Cast(pOwnerEntity.FindComponent(SoundComponent));
	}
}