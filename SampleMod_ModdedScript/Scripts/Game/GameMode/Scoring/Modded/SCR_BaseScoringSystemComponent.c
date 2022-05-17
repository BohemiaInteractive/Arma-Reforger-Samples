// "modded" keyword lets you modify already existing script classes
modded class SCR_BaseScoringSystemComponent : SCR_BaseGameModeComponent
{
	// Method which is called when someone commits suicide in game
	override void AddSuicide(int playerId, int count = 1)
	{
		// If you only want expand already existing method without modifying already existing logic then you can
		// use "super" keyword to invoke original method
		super.AddSuicide(playerId,count);
		
		// Play additional non spatial sound when someone commits suicide
		AudioSystem.PlaySound("{9BB653FF9E065943}Sounds/Animals/Bos_Taurus/Samples/bawl/bawl_0.wav");
	}
}