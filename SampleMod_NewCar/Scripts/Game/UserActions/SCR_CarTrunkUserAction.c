class SCR_TrunkUserAction : ScriptedUserAction
{
	[Attribute( defvalue: "Drawer 1", uiwidget: UIWidgets.EditBox, desc: "Signal name of trunk action in procedural animation project" )]
	protected string m_sSignalName;	//for pairing with the user action
	[Attribute( defvalue: "0", uiwidget: UIWidgets.EditBox, desc: "Value of signal when trunk is closed" )]
	protected float m_fSignalMin;
	[Attribute( defvalue: "1", uiwidget: UIWidgets.EditBox, desc: "Value of signal when trunk is opened" )]
	protected float m_fSignalMax;

	protected int m_iSignalIndex = -1;

	//! Signal manager to pass signals into proc anim
	private SignalsManagerComponent m_SignalsManager;
	//! Sound component
	private SCR_VehicleSoundComponent m_SoundComponent;

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
		float targetValue = Math.AbsFloat((m_SignalsManager.GetSignalValue(m_iSignalIndex)) - m_fSignalMax);
		m_SignalsManager.SetSignalValue(m_iSignalIndex, targetValue);

		// Play sound
		if (m_SoundComponent)
		{
			if(targetValue > 0)
			{
				m_SoundComponent.SoundEvent("SOUND_CONTAINER_OPEN");
			}
			else
			{
				m_SoundComponent.SoundEvent("SOUND_CONTAINER_CLOSE");
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
		m_SoundComponent = SCR_VehicleSoundComponent.Cast(pOwnerEntity.FindComponent(SCR_VehicleSoundComponent));
	}
}