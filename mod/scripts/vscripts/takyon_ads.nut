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
    ad1.message = format("%s Welcome to Karma Kraber9k! This is a high air acceleration, Kraber only server.", "\x1b[38;2;0;135;220m")
    ad1.tags = ["trigger", "start"]
    sa_ads.append(ad1)
    
    // example of ad that triggers wen a client connects but can also trigger in the usual loop of ads
    Ad ad2
    ad2.message = format("%s Cheater? Troublemaker? Bug Report? Make a ticket in the Karma Discord at %skarma-gaming.net/go/discord", "\x1b[38;2;220;220;0m", "\x1b[38;2;0;220;30m")
    ad2.priority = 1
    sa_ads.append(ad2)
    
    // example of ad that triggers on kill but can also trigger in the usual loop of ads
    Ad ad3 
    ad3.message = format("%s Want a tutorial? Join the Kraber9k Discord at %skarma-gaming.net/go/kraber9k %sto find Slimeafro's video.", "\x1b[38;2;0;135;220m", "\x1b[38;2;0;220;30m", "\x1b[38;2;0;135;220m")
    ad3.priority = 1
    sa_ads.append(ad3)
    
    // example of ad with color
    Ad ad4
    ad4.message = format("%s To vote to skip the map, type %s!rtv %sor %s!skip %sin chat.", "\x1b[38;2;220;220;0m", "\x1b[38;2;220;50;50m", "\x1b[38;2;220;220;0m", "\x1b[38;2;220;50;50m", "\x1b[38;2;220;220;0m")
    ad4.priority = 1
    sa_ads.append(ad4)

    // example of ad with color
    Ad ad5
    ad5.message = format("%s Join the Karma Discord at %skarma-gaming.net/go/discord %sand the Kraber9k Discord at %skarma-gaming.net/go/kraber9k", "\x1b[38;2;0;135;220m", "\x1b[38;2;0;220;30m", "\x1b[38;2;0;135;220m", "\x1b[38;2;0;220;30m")
    ad5.priority = 1
    sa_ads.append(ad5)

    // example of ad with color
    Ad ad6
    ad6.message = format("%s To vote to balance teams by K/D, type %s!balance %sin chat.", "\x1b[38;2;220;220;0m", "\x1b[38;2;220;50;50m", "\x1b[38;2;220;220;0m")
    ad6.priority = 1
    sa_ads.append(ad6)
    
    // example of ad with color
    Ad ad7
    ad7.message = format("%s To vote to extend the map time, type %s!extend %sin chat.", "\x1b[38;2;220;220;0m", "\x1b[38;2;220;50;50m", "\x1b[38;2;220;220;0m")
    ad7.priority = 1
    sa_ads.append(ad7)

    // example of ad with color
    Ad ad8
    ad8.message = format("%s To see top ranked players, type %s!top %sand to see top speed players, type %s!topspeed%s.", "\x1b[38;2;220;220;0m", "\x1b[38;2;220;50;50m", "\x1b[38;2;220;220;0m", "\x1b[38;2;220;50;50m", "\x1b[38;2;220;220;0m")
    ad8.priority = 1
    sa_ads.append(ad8)
    
    // example of ad with color
    Ad ad9
    ad9.message = format("%s To opt out of ranks, type %s!track %sand to disable point messages, type %s!pointfeed%s.", "\x1b[38;2;220;220;0m", "\x1b[38;2;220;50;50m", "\x1b[38;2;220;220;0m", "\x1b[38;2;220;50;50m", "\x1b[38;2;220;220;0m")
    ad9.priority = 1
    sa_ads.append(ad9)
    
    // example of ad with color
    Ad ad10
    ad10.message = format("%s To check top playtime, type %s!toptime %sand to check your playtime, type %s!ranktime%s.", "\x1b[38;2;220;220;0m", "\x1b[38;2;220;50;50m", "\x1b[38;2;220;220;0m", "\x1b[38;2;220;50;50m", "\x1b[38;2;220;220;0m")
    ad10.priority = 1
    sa_ads.append(ad10)
}
