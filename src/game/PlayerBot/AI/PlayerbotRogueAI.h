/*
 * This file is part of the CMaNGOS Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef _PlayerbotRogueAI_H
#define _PlayerbotRogueAI_H

#include "../Base/PlayerbotClassAI.h"

enum
{
    RogueCombat,
    RogueSpellPreventing,
    RogueThreat,
    RogueStealth
};

enum RoguePoisonDisplayId
{
    DEADLY_POISON_DISPLAYID         = 13707,
    CRIPPLING_POISON_DISPLAYID      = 13708,
    MIND_NUMBLING_POISON_DISPLAYID  = 13709,
    INSTANT_POISON_DISPLAYID        = 13710,
    WOUND_POISON_DISPLAYID          = 37278,
    ANESTHETIC_POISON_DISPLAYID     = 34432,
};

enum RogueSpells
{
    ADRENALINE_RUSH_1               = 13750,
    AMBUSH_1                        = 8676,
    BACKSTAB_1                      = 53,
    BLADE_FLURRY_1                  = 13877,
    BLIND_1                         = 2094,
    CHEAP_SHOT_1                    = 1833,
    CLOAK_OF_SHADOWS_1              = 31224,
    COLD_BLOOD_1                    = 14177,
    DEADLY_THROW_1                  = 26679,
    DISARM_TRAP_1                   = 1842,
    DISTRACT_1                      = 1725,
    ENVENOM_1                       = 32645,
    EVASION_1                       = 5277,
    EVISCERATE_1                    = 2098,
    EXPOSE_ARMOR_1                  = 8647,
    FEINT_1                         = 1966,
    GARROTE_1                       = 703,
    GHOSTLY_STRIKE_1                = 14278,
    GOUGE_1                         = 1776,
    HEMORRHAGE_1                    = 16511,
    KICK_1                          = 1766,
    KIDNEY_SHOT_1                   = 408,
    MUTILATE_1                      = 1329,
    PICK_LOCK_1                     = 1804,
    PICK_POCKET_1                   = 921,
    PREMEDITATION_1                 = 14183,
    PREPARATION_1                   = 14185,
    RIPOSTE_1                       = 14251,
    RUPTURE_1                       = 1943,
    SAP_1                           = 6770,
    SHADOWSTEP_1                    = 36554,
    SHIV_1                          = 5938,
    SINISTER_STRIKE_1               = 1752,
    SLICE_AND_DICE_1                = 5171,
    SPRINT_1                        = 2983,
    STEALTH_1                       = 1784,
    VANISH_1                        = 1856
};
//class Player;

class PlayerbotRogueAI : PlayerbotClassAI
{
    public:
        PlayerbotRogueAI(Player* const master, Player* const bot, PlayerbotAI* const ai);
        virtual ~PlayerbotRogueAI();

        // all combat actions go here
        CombatManeuverReturns DoFirstCombatManeuver(Unit* pTarget);
        CombatManeuverReturns DoNextCombatManeuver(Unit* pTarget);

        // all non combat actions go here, ex buffs, heals, rezzes
        void DoNonCombatActions();

    private:
        CombatManeuverReturns DoFirstCombatManeuverPVE(Unit* pTarget);
        CombatManeuverReturns DoNextCombatManeuverPVE(Unit* pTarget);
        CombatManeuverReturns DoFirstCombatManeuverPVP(Unit* pTarget);
        CombatManeuverReturns DoNextCombatManeuverPVP(Unit* pTarget);
        Item* FindPoison() const;

        // COMBAT
        uint32 ADRENALINE_RUSH,
               SINISTER_STRIKE,
               BACKSTAB,
               GOUGE,
               EVASION,
               SPRINT,
               KICK,
               FEINT,
               SHIV;

        // SUBTLETY
        uint32 SHADOWSTEP,
               STEALTH,
               VANISH,
               HEMORRHAGE,
               BLIND,
               PICK_POCKET,
               CLOAK_OF_SHADOWS,
               CRIPPLING_POISON,
               DEADLY_POISON,
               MIND_NUMBING_POISON,
               GHOSTLY_STRIKE,
               DISTRACT,
               PREPARATION,
               PREMEDITATION;

        // ASSASSINATION
        uint32 COLD_BLOOD,
               EVISCERATE,
               SLICE_DICE,
               GARROTE,
               EXPOSE_ARMOR,
               AMBUSH,
               RUPTURE,
               CHEAP_SHOT,
               KIDNEY_SHOT,
               MUTILATE,
               ENVENOM,
               DEADLY_THROW;

        // racial
        uint32 ARCANE_TORRENT,
               GIFT_OF_THE_NAARU,
               STONEFORM,
               ESCAPE_ARTIST,
               PERCEPTION,
               SHADOWMELD,
               BLOOD_FURY,
               WAR_STOMP,
               BERSERKING,
               WILL_OF_THE_FORSAKEN;

        uint32 SpellSequence, LastSpellCombat, LastSpellSubtlety, LastSpellAssassination, Aura;
};

#endif
