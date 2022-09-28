# Marvel legendary setup

num_players <- 3

# ml_setup(num_players=num_players,plots=plots,commanders=commanders,adversaries=adversaries,backups=backups,allies=allies)

plots <- c("Build an Underground Mega-vault Prison","Cage Villains in Power-Suppressing Cells","Capture Baby Hope",
           "The Clone Saga","Crown Thor King of Asgard","Crush Hydra","Detonate the Helicarrier",
           "Graduation at Xavier's X-Academy","Infiltrate the Lair with Spies","Invade the Daily Bugle News HQ",
           "Mass Produce War Machine Armor","Massive Earthquake Generator","Organized Crime Wave",
           "Resurrect Heroes with the Norn Stones","Save Humanity","Splice Humans with Spider DNA",
           "Steal the Weaponized Plutonium","Transform Citizens Into Demons","Weave a Web of Lies",
           "X-Cutioner's Song")

plots <- c("Build an Underground Mega-vault Prison","Cage Villains in Power-Suppressing Cells",
           "Crown Thor King of Asgard","Crush Hydra",
           "Graduation at Xavier's X-Academy","Infiltrate the Lair with Spies",
           "Mass Produce War Machine Armor","Resurrect Heroes with the Norn Stones")


commanders <- c("Apocalypse","Carnage","Dr. Strange","Kingpin","Mephisto","Mr. Sinister","Mysterio","Nick Fury","Odin",
                "Professor X","Stryfe")

commanders <- c("Dr. Strange","Nick Fury","Odin","Professor X")


adversaries <- c("Avengers","Defenders","Marvel Knights","Spider-friends",
                 "Uncanny Avengers","Uncanny X-Men","X-Men First Class")


backups <- c("Asgardian Warrior","Cops","Maggia Goons","Multiple Man","Phalanx","S.H.I.E.L.D. Assault Squad")
backups <- c("Asgardian Warrior","Cops","Multiple Man","S.H.I.E.L.D. Assault Squad")


allies <- c("Angel","Bishop","Black Cat","Blade","Bullseye","Cable","Colossus","Daredevil","Domino","Dr. Octopus","Electro",
            "Elektra","Enchantress","Forge","Ghost Rider","Green Goblin","Iceman","Iron Fist","Jean Grey","Juggernaut",
            "Kingpin","Kraven","Loki","Magneto","Moon Knight","Mysterio","Mystique","Nightcrawler","Professor X","Punisher",
            "Sabretooth","Scarlet Spider","Spiderwoman","Symbiote Spiderman","Ultron","Venom","Wolverine")
allies <- c("Bullseye","Dr. Octopus","Electro","Enchantress","Green Goblin","Juggernaut",
            "Kingpin","Kraven","Loki","Magneto","Mysterio","Mystique",
            "Sabretooth","Ultron","Venom")


notes_func <- function(name){
  out <- NULL
  if(name=="Build an Underground Mega-vault Prison"){out <- "The Bindings stack holds 5 Bindings per player."}
  if(name=="Cage Villains in Power-Suppressing Cells"){out <- "Stack 2 Cops per player next to this Plot."}
  if(name=="Capture Baby Hope"){out <- "Put a token on this Plot to represent the baby, Hope Summers."}
  if(name=="Crown Thor King of Asgard"){out <- "Put the Thor Adversary next to this Plot."}
  if(name=="Detonate the Helicarrier"){out <- "6 Heroes in the Allies Deck."}
  if(name=="Graduation at Xavier's X-Academy"){out <- "Stack 8 Bystanders next to this Plot as Young Mutants."}
  if(name=="Infiltrate the Lair with Spies"){out <- "Stack 21 Bystanders next to this Plot as Infiltrating Spies."}
  if(name=="Invade the Daily Bugle News HQ"){out <- "Add 6 extra Backup Adversaries from a single group to the Allies Deck."}
  if(name=="Mass Produce War Machine Armor"){out <- "Include 10 S.H.I.E.L.D. Assault Squads as one of the Backup Adversary groups."}
  # if(name=="Massive Earthquake Generator"){out <- NULL}
  if(name=="Organized Crime Wave"){out <- "Include 10 Maggia Goons as one of the Backup Adversary groups."}
  # if(name=="Resurrect Heroes with the Norn Stones"){out <- NULL}
  if(name=="Save Humanity"){out <- "24 Bystanders in the Allies Deck. (1 player: 12 Bystanders in the Allies Deck)"}
  if(name=="Splice Humans with Spider DNA"){out <- "Include Sinister Six as one of the Adversary groups."}
  if(name=="Steal the Weaponized Plutonium"){out <- "Add an extra Adversary group."}
  if(name=="Transform Citizens Into Demons"){out <- "Adversary Deck includes 14 extra Jean Grey cards and no Bystanders."}
  if(name=="Weave a Web of Lies"){out <- "7 Twists"}
  if(name=="X-Cutioner's Song"){out <- "Adversary Deck includes 14 cards for an extra Ally and no Bystanders"}
  return(out)
}



ml_setup <- function(num_players,plots=plots,commanders=commanders,adversaries=adversaries,backups=backups,allies=allies){
  pl <- sample(plots,1)  # choose plot
  
  com <- sample(commanders,1)  # choose commander
  
  # setup storage for decks
  adv <- NULL
  back <- NULL
  ally <- NULL
  extra_ally <- NULL
  extra_backup <- NULL
  ifelse(pl=="Weave a Web of Lies",twists<-7,twists<-8)
  
  # card requirements depending on number of players
  if(num_players==1){num_adv<-1;num_back<-1;num_allies<-3;num_byst<-1}
  if(num_players==2){num_adv<-2;num_back<-1;num_allies<-5;num_byst<-2}
  if(num_players==3){num_adv<-3;num_back<-1;num_allies<-5;num_byst<-8}
  if(num_players==4){num_adv<-3;num_back<-2;num_allies<-5;num_byst<-8}
  if(num_players==5){num_adv<-4;num_back<-2;num_allies<-6;num_byst<-12}
    
    # plot requirements
    if(pl=="Cage Villains in Power-Suppressing Cells"){backups <- backups[-which(backups=="Cops")]}
    if(pl=="Detonate the Helicarrier"){num_allies<-6}
    if(pl=="Invade the Daily Bugle News HQ"){
      if(com=="Odin"){extra_backup<-sample(backups[-which(backups=="Asgardian Warrior")],1)}
      else{
        extra_backup <- sample(backups,1)
        backups<-backups[-which(backups==extra_backup)]
      }
    }
    if(pl=="Mass Produce War Machine Armor"){back<-"S.H.I.E.L.D. Assault Squad";backups<-backups[-which(backups=="S.H.I.E.L.D. Assault Squad")]}
    if(pl=="Organized Crime Wave"){back <- "Maggia Goons";backups<-backups[-which(backups=="Maggia Goons")]}
    if(pl=="Splice Humans with Spider DNA"){
      adv <- "Sinister Six"
      adversaries <- adversaries[-which(adversaries==adv)]
    }
    if(pl=="Steal the Weaponized Plutonium"){num_adv <- num_adv+1}
  
    # Commander requirements
    if(num_players>1){
    if(pl!="Splice Humans with Spider DNA"){
      if(com=="Apocalypse"){adv <- "Four Horsemen";adversaries<-adversaries[-which(adversaries=="Four Horsemen")]}
      if(com=="Carnage"){adv <- "Maximum Carnage";adversaries<-adversaries[-which(adversaries=="Maximum Carnage")]}
      if(com=="Dr. Strange"){adv <- "Defenders";adversaries<-adversaries[-which(adversaries=="Defenders")]}
      if(com=="Kingpin"){adv <- "Streets of New York";adversaries<-adversaries[-which(adversaries=="Streets of New York")]}
      if(com=="Mephisto"){adv <- "Underworld";adversaries<-adversaries[-which(adversaries=="Underworld")]}
      if(com=="Mr. Sinister"){adv <- "Marauders";adversaries<-adversaries[-which(adversaries=="Marauders")]}
      if(com=="Mysterio"){adv <- "Sinister Six";adversaries<-adversaries[-which(adversaries=="Sinister Six")]}
      if(com=="Nick Fury"){adv <- "Avengers";adversaries<-adversaries[-which(adversaries=="Avengers")]}
      if(com=="Professor X"){adv <- "X-Men First Class";adversaries<-adversaries[-which(adversaries=="X-Men First Class")]}
      if(com=="Stryfe"){adv <- "MLF";adversaries<-adversaries[-which(adversaries=="MLF")]}
    }
    if(pl=="Splice Humans with Spider DNA" & num_adv>1){
      if(com=="Apocalypse"){adv <- c(adv,"Four Horsemen");adversaries<-adversaries[-which(adversaries=="Four Horsemen")]}
      if(com=="Carnage"){adv <- c(adv,"Maximum Carnage");adversaries<-adversaries[-which(adversaries=="Maximum Carnage")]}
      if(com=="Dr. Strange"){adv <- c(adv,"Defenders");adversaries<-adversaries[-which(adversaries=="Defenders")]}
      if(com=="Kingpin"){adv <- c(adv,"Streets of New York");adversaries<-adversaries[-which(adversaries=="Streets of New York")]}
      if(com=="Mephisto"){adv <- c(adv,"Underworld");adversaries<-adversaries[-which(adversaries=="Underworld")]}
      if(com=="Mr. Sinister"){adv <- c(adv,"Marauders");adversaries<-adversaries[-which(adversaries=="Marauders")]}
      # if(com=="Mysterio"){adv <- c(adv,"Sinister Six")}
      if(com=="Nick Fury"){adv <- c(adv,"Avengers");adversaries<-adversaries[-which(adversaries=="Avengers")]}
      if(com=="Professor X"){adv <- c(adv,"X-Men First Class");adversaries<-adversaries[-which(adversaries=="X-Men First Class")]}
      if(com=="Stryfe"){adv <- c(adv,"MLF");adversaries<-adversaries[-which(adversaries=="MLF")]}
    }

  
    if(pl!="Mass Produce War Machine Armor" && pl!="Organized Crime Wave"){
      if(com=="Odin"){back<-"Asgardian Warrior";backups<-backups[-which(backups=="Asgardian Warrior")]}
    }
    if(pl=="Mass Produce War Machine Armor" || pl=="Organized Crime Wave"){
      if(num_back>1){if(com=="Odin"){back<-c(back,"Asgardian Warrior")}}
      # else{back <- back}
    }
    }
    
    
    # determine (remaining) adversaries
    adv <- sort(c(adv,sample(adversaries,num_adv-length(adv))))
      if(pl=="Transform Citizens Into Demons"){
        # adv <- c(adv,"Jean Grey")
        allies<-allies[-which(allies=="Jean Grey")]
        num_byst <- 0
      }
      if(pl=="X-Cutioner's Song"){
        extra_ally <- sample(allies,1)
        allies<-allies[-which(allies==as.character(extra_ally))]
        # adv <- c(adv,extra_ally)
        num_byst <- 0
      }
    # determing (remaining) backup adversaries
    back <- sort(c(back,sample(backups,num_back-length(back))))
    # determing allies
    ally <- sort(sample(allies,num_allies))
    
    # include plot setup notes
    note <- notes_func(pl)
    
    # adversary deck
    back<-c(back,rep(NA,length(adv)-length(back))) # fill backup with NA
    if(!is.null(extra_ally)||pl=="Transform Citizens Into Demons"){ # include extra if needed
      if(pl=="Transform Citizens Into Demons"){
        advers_deck <- data.frame(Adversaries=adv,Backups=back,
                                  Extra = c("Jean Grey",rep(NA,length(adv)-1)),
                                  Bystanders=c(num_byst,rep(NA,length(adv)-1)),
                                  Twists=c(twists,rep(NA,max(length(adv),length(back))-1)),
                                  Command_Strikes=c(5,rep(NA,max(length(adv),length(back))-1)))
      }
      if(!is.null(extra_ally)){
        advers_deck <- data.frame(Adversaries=adv,Backups=back,
                                  Extra = c(extra_ally,rep(NA,length(adv)-1)),
                                  Bystanders=c(num_byst,rep(NA,length(adv)-1)),
                                  Twists=c(twists,rep(NA,max(length(adv),length(back))-1)),
                                  Command_Strikes=c(5,rep(NA,max(length(adv),length(back))-1)))
      }
    }
    else { # adv deck without extra allies added
      advers_deck <- data.frame(Adversaries=adv,Backups=back,
                                Bystanders=c(num_byst,rep(NA,length(adv)-1)),
                                Twists=c(twists,rep(NA,max(length(adv),length(back))-1)),
                                Command_Strikes=c(5,rep(NA,max(length(adv),length(back))-1)))
    }
    # allies deck
    if(!is.null(extra_backup)){ally_deck<-data.frame(Allies=ally,Extra=c(extra_backup,rep(NA,length(ally)-1)))} # include adversaries if needed
    else if(pl=="Save Humanity"){ally_deck<-data.frame(Allies=ally,Extra=c("Bystanders",rep(NA,length(ally)-1)))} # include bystanders if needed
    else {ally_deck<-data.frame(Allies=ally)} # ally deck without extras
    
    return(list(Plot=pl,Commander=com,Adversary_Deck=advers_deck,Allies_Deck=ally_deck,Notes=note)) # return setup results
}


ml_setup(num_players=num_players,plots=plots,commanders=commanders,adversaries=adversaries,backups=backups,allies=allies)




