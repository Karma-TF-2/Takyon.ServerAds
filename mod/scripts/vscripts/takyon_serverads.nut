global function ServerAdsInit

array<Ad> adsWithPrio = []
float lastKillCallback = -9999
float lastConnectedCallback = -9999
int killDelay = 10
int connectedDelay = 10

void function ServerAdsInit(){
	AddCallback_OnPlayerKilled(SA_PlayerKilledCallback)
	AddCallback_GameStateEnter(eGameState.Playing, SA_PlayingCallback)
	AddCallback_OnClientConnected(SA_ClientConnectedCallback)

	LoadAds()
	thread ServerAdsMain()
}

void function ServerAdsMain(){
	for(;;){
		PostAd()
		wait GetConVarFloat("sa_time_between_ads")
	}
}

/*
 *	CALLBACKS
 */

void function SA_PlayingCallback(){
	foreach(Ad ad in sa_ads){
		if(ad.tags.contains("start") && GetConVarFloat("sa_probability_start") >= (sa_rndint(100)/100))
			Chat_ServerBroadcast(ad.message)
	}
}

void function SA_PlayerKilledCallback(entity victim, entity attacker, var damageInfo){
	if(Time() - lastKillCallback < killDelay) // making a delay between kills to avoid random spam if there was a collat, etc
		return
	
	foreach(Ad ad in sa_ads){
		if(ad.tags.contains("kill") && GetConVarFloat("sa_probability_kill") >= (sa_rndint(100)/100)){
			Chat_ServerBroadcast(ad.message)
			lastKillCallback = Time()
		}
	}
}

void function SA_ClientConnectedCallback(entity player){
	if(Time() - lastConnectedCallback < connectedDelay) // making a delay between connects to avoid spam on match start
		return
	
	foreach(Ad ad in sa_ads){
		if(ad.tags.contains("connected") && GetConVarFloat("sa_probability_connected") >= (sa_rndint(100)/100)){
			Chat_ServerBroadcast(ad.message)
			lastConnectedCallback = Time()
		}
	}
}

/*
 *	HELPER FUNCS
 */

void function PostAd(){
	if(adsWithPrio.len() > 0 && GetConVarBool("sa_ads_enabled"))
		Chat_ServerBroadcast(adsWithPrio[rndint(adsWithPrio.len() - 1)].message)
}

void function LoadAds(){
	foreach(Ad ad in sa_ads){
		if(!ad.tags.contains("trigger")){
			for(int i = 0; i < ad.priority; i++){
				adsWithPrio.append(ad)
			}
		}
	}
}

int function sa_rndint(int max) {
    // Generate a pseudo-random integer between 0 and max
    float roll = 1.0 * max * rand() / RAND_MAX;
    return roll.tointeger();
}