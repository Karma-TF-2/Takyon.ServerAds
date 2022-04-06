global function ServerAdsInit

array<Ad> adsWithPrio = []

void function ServerAdsInit(){
	LoadAds()
	thread ServerAdsMain()
}

void function ServerAdsMain(){
	for(;;){
		PostAd()
		wait GetConVarFloat("sa_time_between_ads")
	}
}

void function PostAd(){
	if(adsWithPrio.len() > 0 && GetConVarBool("sa_ads_enabled"))
		Chat_ServerBroadcast(adsWithPrio[rndint(adsWithPrio.len() - 1)].message)
}

void function LoadAds(){
	foreach(Ad ad in sa_ads){
		for(int i = 0; i < ad.priority; i++){
			adsWithPrio.append(ad)
			print("appended")
		}
	}
}

int function sa_rndint(int max) {
    // Generate a pseudo-random integer between 0 and max
    float roll = 1.0 * max * rand() / RAND_MAX;
    return roll.tointeger();
}