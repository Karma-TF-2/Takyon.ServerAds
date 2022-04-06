global function AdInit

global struct Ad{
    string message
    int priority = 1 // 1 is lowest, higher prio -> gets posted more often
}

global array<Ad> sa_ads = [] // dont forget to add your ads

// for colors check https://r2northstar.readthedocs.io/en/latest/reference/northstar/chathooks.html#ansi-escape-codes
// add color coding by adding %s to insert a string

void function AdInit(){
    Ad ad1 
    ad1.message = "You're playing on a cool server!"
    ad1.priority = 1
    sa_ads.append(ad1)

    Ad ad2 
    ad2.message = format("%sJoin our %sDiscord!", "\x1b[38;2;220;220;0m", "\x1b[38;2;0;135;220m")
    ad2.priority = 3
    sa_ads.append(ad2)
}



