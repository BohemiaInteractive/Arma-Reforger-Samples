modded class SCR_ScoringSystemComponent : SCR_BaseScoringSystemComponent
{
	override int CalculateScore(SCR_ScoreInfo info)
	{
		// We are replacing there modifiers which would normally provided via parameters 
		// m_iDeathScoreMultiplier is replaced by 10
		// m_iSuicideScoreMultiplier is also replaced by 10
		// That translates into situation where for every death or suicide, you are getting ten shiny points!
		int score = info.m_iKills 		* m_iKillScoreMultiplier +
					info.m_iTeamKills 	* m_iTeamKillScoreMultiplier +
					info.m_iDeaths		* 10 +
					info.m_iSuicides 	* 10 +
					info.m_iObjectives 	* m_iObjectiveScoreMultiplier;
		
		// Original  code from CalculateScore - we are leaving it untouched 
		if (score < 0)
			return 0;
		
		return score;
	}	
}