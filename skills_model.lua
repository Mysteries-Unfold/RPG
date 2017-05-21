

skill 					 = {}
skill.name               = ""      --the name of the skill
skill.type               = "atk"   --atk, spatk, buf, debuff
skill.damage             = 0       --if buff or debuff, it should be 0
skill.effect             = "none"  --buff, debuff effect, if atk or spatk, effect = "none"
skill.target             = ""      --empty string, the encontro mechanics set the target
skill.cost               = 0       --mp cost of the skill, 
skill.desc               = ""      --description of the skill to show the user
skill.anim               = nil     --the animation to be used
skill.turn_effect        = 1       --how many turns the effect will be used, for atk and sp atk, this will be 1

skill.charge 			 = {}
skill.charge.name        =         --the name of the charge skill
skill.charge.damage      = 0       --charge extra damage, the total damage will be damage + charge.damage
skill.charge.turn_effect = 1       --same thing, but the charge turns can be different than the skill turns
skill.charge.desc        = 1       --same thing
skill.charge.target      = ""      --if not especified first(ex: "all"),it will be the same as the skill itself
skill.charge.anim        = nil     --charge.animation, it will be used istead of the normal skilll animation
skill.charge.cost        = 0       --charge extra cost, the total cost will be skill.cost + skill.charge.cost