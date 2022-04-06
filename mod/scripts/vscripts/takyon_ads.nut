global function AdInit

global struct Ad{
    string message
    int priority = 1 // 1 is lowest, higher prio -> gets posted more often
    array<string> tags = [] // tags allow categorization. use tags like "kill" "start" "connected" to give a chance to trigger these messages. 
                            // if you want messages to only be sent on trigger, like welcome messages on start add the tag "trigger"
}

global array<Ad> sa_ads = [] // dont forget to add your ads

// for colors check https://r2northstar.readthedocs.io/en/latest/reference/northstar/chathooks.html#ansi-escape-codes
// add color coding by adding %s to insert a string

void function AdInit(){
    // example of simple ad
    Ad ad1 
    ad1.message = "You're playing on a cool server!"
    ad1.priority = 1
    sa_ads.append(ad1)

    // example of ad with color
    Ad ad2 
    ad2.message = format("%sJoin our %sDiscord!", "\x1b[38;2;220;220;0m", "\x1b[38;2;0;135;220m")
    ad2.priority = 3
    sa_ads.append(ad2)

    // example of ad that triggers on kill but can also trigger in the usual loop of ads
    Ad ad3 
    ad3.message = "Need a tutorial? Join our Discord!"
    ad3.tags = ["kill"]
    sa_ads.append(ad3)

    // example of ad that triggers on game start but cannot trigger in the usual loop of ads
    Ad ad4 
    ad4.message = "Welcome to the community! GLHF!"
    ad4.tags = ["trigger", "start"]
    sa_ads.append(ad4)

    // example of ad that triggers wen a client connects but can also trigger in the usual loop of ads
    Ad ad5
    ad5.message = "New here? Get a tutorial on our discord!"
    ad5.tags = ["connected"]
    sa_ads.append(ad5)
}



