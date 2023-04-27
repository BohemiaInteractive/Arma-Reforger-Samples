// Modified version of script found in SampleMod_NewProp - https://community.bistudio.com/wiki/Arma_Reforger:Prop_Creation#Adding_scripted_action
class SCR_FlipSignalUserAction : ScriptedUserAction
{
	[Attribute( defvalue: "", uiwidget: UIWidgets.EditBox, desc: "Name of signal" )]
	protected string m_sSignalName;	//for pairing with the user action

	[Attribute( defvalue: "On", uiwidget: UIWidgets.EditBox, desc: "Name of signal" )]
	protected string m_sStringActionOn;
	
	[Attribute( defvalue: "Off", uiwidget: UIWidgets.EditBox, desc: "Name of signal" )]
	protected string m_sStringActionOff;
	
	[Attribute( defvalue: "", uiwidget: UIWidgets.EditBox, desc: "Name of signal" )]
	protected string m_sAudioEventOn;
	
	[Attribute( defvalue: "", uiwidget: UIWidgets.EditBox, desc: "Name of signal" )]
	protected string m_sAudioEventOff;
	
	[Attribute( defvalue: "1", uiwidget: UIWidgets.EditBox, desc: "Name of signal" )]
	protected float m_fMaxSignalValue;
	

	protected int m_iSignalIndex = -1;
	
	//! Signal manager to pass signals into proc anim
	private SignalsManagerComponent m_SignalsManager;
	//! Sound component
	private SoundComponent m_SoundComponent;

	//------------------------------------------------------------------------------------------------
	override bool CanBeShownScript(IEntity user)
	{
		ChimeraCharacter character = ChimeraCharacter.Cast(SCR_PlayerController.GetLocalControlledEntity());
		if(!character)
			return false;
		
		CharacterControllerComponent controller = character.GetCharacterController();	
		if(!controller)
			return false;		
				
		if(!controller.GetInspect())
			return false;
		
		BaseWeaponManagerComponent weaponManager = controller.GetWeaponManagerComponent();
		if(!weaponManager)
			return false;

		BaseWeaponComponent weaponComp = controller.GetWeaponManagerComponent().GetCurrentWeapon();
		if(!weaponComp)
			return false;	
		
		return true;
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
		float targetValue = Math.AbsFloat((m_SignalsManager.GetSignalValue(m_iSignalIndex)) - m_fMaxSignalValue);
		m_SignalsManager.SetSignalValue(m_iSignalIndex, targetValue);

		// Play sound
		if (m_SoundComponent)
		{
			if(targetValue > 0)
			{
				m_SoundComponent.SoundEvent(m_sAudioEventOn);
			}
			else
			{
				m_SoundComponent.SoundEvent(m_sAudioEventOff);
			}
		}
	}

	//------------------------------------------------------------------------------------------------
	override bool GetActionNameScript(out string outName)
	{
		if((m_SignalsManager.GetSignalValue(m_iSignalIndex)) == 0)
		{
			outName = m_sStringActionOn;
		} else
		{
			outName = m_sStringActionOff;
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