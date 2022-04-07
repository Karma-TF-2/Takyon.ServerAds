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
    // example of ad that triggers on game start but cannot trigger in the usual loop of ads
    Ad ad1
    ad1.message = format("%s Welcome to Karma Kraber9k! This is a high air acceleration, kraber only server.", "\x1b[38;2;0;135;220m")
    ad1.tags = ["trigger", "start"]
    sa_ads.append(ad1)
    
    // example of ad that triggers wen a client connects but can also trigger in the usual loop of ads
    Ad ad2
    ad2.message = format("%s Cheater? Troublemaker? Bug Report? Make a ticket in our Discord at discord.gg/karmagaming", "\x1b[38;2;220;220;0m")
    ad2.tags = ["connected"]
    sa_ads.append(ad2)
    
    // example of ad that triggers on kill but can also trigger in the usual loop of ads
    Ad ad3 
    ad3.message = format("%s Want a tutorial? Join our Discord at karma-gaming.net/go/kraber9k to find Slimeafro's video.", "\x1b[38;2;0;135;220m")
    ad3.tags = ["kill"]
    sa_ads.append(ad3)
    
    // example of ad with color
    Ad ad4
    ad4.message = format("%s To vote to skip the map, type !rtv or !skip in chat.", "\x1b[38;2;220;220;0m")
    ad4.priority = 1
    sa_ads.append(ad4)

    // example of ad with color
    Ad ad5
    ad5.message = format("%s Join the Karma Discord at discord.gg/karmagaming and the Kraber9k Discord at karma-gaming.net/go/kraber9k", "\x1b[38;2;0;135;220m")
    ad5.priority = 2
    sa_ads.append(ad5)
}
