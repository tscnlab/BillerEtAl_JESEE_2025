#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
data=read.csv('CajochenASEAN_DATA_2023-10-30_1216.csv')
#Setting Labels

label(data$record_id)="Study ID"
label(data$redcap_event_name)="Event Name"
label(data$registrierung_fr_studie_timestamp)="Survey Timestamp"
label(data$code)="Code Proband:in (JJJJ/VV/MM):"
label(data$teilnahme)="Hat diese Person das CRF ausgefüllt und nimmt an der Studie teil?"
label(data$registrierung_fr_studie_complete)="Complete?"
label(data$leba_weekly_timestamp)="Survey Timestamp"
label(data$leba_f1_01_2)="Ich habe tagsüber in Innenräumen eine Brille mit Blaulichtfilter, eine orange-getönte und/oder rot-getönte Brille getragen."
label(data$leba_f1_02_2)="Ich habe tagsüber draußen eine Brille mit Blaulichtfilter, eine orange-getönte und/oder rot-getönte Brille getragen."
label(data$leba_f1_03_2)="Ich habe innerhalb einer Stunde, bevor ich einschlafen wollte, eine Brille mit Blaulichtfilter, eine orange-getönte und/oder rot-getönte Brille getragen."
label(data$leba_f2_04_2)="Ich habe pro Tag insgesamt 30 Minuten oder weniger draußen verbracht."
label(data$leba_f2_05_2)="Ich habe pro Tag insgesamt zwischen 30 Minuten und einer Stunde draußen verbracht."
label(data$leba_f2_06_2)="Ich habe pro Tag insgesamt zwischen einer und drei Stunden draußen verbracht."
label(data$leba_f2_07_2)="Ich habe pro Tag insgesamt mehr als drei Stunden draußen verbracht. "
label(data$leba_f2_08_2)="Ich habe so viel Zeit wie möglich draußen verbracht."
label(data$leba_f2_09_2)="Ich habe innerhalb von zwei Stunden nach dem Aufwachen draußen Sport oder einen Spaziergang gemacht."
label(data$leba_f3_10_2)="Ich habe innerhalb einer Stunde, bevor ich einschlafen wollte, mein Handy verwendet."
label(data$leba_f3_11_2)="Ich habe sofort nach dem Aufwachen auf den Bildschirm meines Handys geschaut."
label(data$leba_f3_12_2)="Wenn ich nachts aufgewacht bin, habe ich auf mein Handy geschaut."
label(data$leba_f3_13_2)="Ich habe innerhalb einer Stunde, bevor ich einschlafen wollte, auf meine Smartwatch geschaut."
label(data$leba_f3_14_2)="Wenn ich nachts aufgewacht bin, habe ich auf meine Smartwatch geschaut."
label(data$leba_f4_15_2)="Ich habe innerhalb einer Stunde, bevor ich einschlafen wollte, den Bildschirm meines Handys gedimmt."
label(data$leba_f4_16_2)="Ich habe innerhalb einer Stunde, bevor ich einschlafen wollte, eine Blaulichtfilter-App für meinen Computerbildschirm genutzt."
label(data$leba_f4_17_2)="Wenn ich nachts aufgestanden bin, habe ich so wenig Licht wie möglich genutzt."
label(data$leba_f4_18_2)="Ich habe innerhalb einer Stunde, bevor ich einschlafen wollte, den Computerbildschirm gedimmt."
label(data$leba_f5_19_2)="Ich habe einstellbare Lichtsysteme genutzt, um gesunde Lichtverhältnisse zu schaffen."
label(data$leba_f5_20_2)="Ich habe spezielle LED-Leuchten genutzt, um gesunde Lichtverhältnisse zu schaffen."
label(data$leba_f5_21_2)="Ich habe eine Leselampe für Tätigkeiten genutzt, die Konzentration erfordern."
label(data$leba_f5_22_2)="Ich habe einen Lichtwecker mit Sonnenaufgangssimulation genutzt."
label(data$leba_f5_23_2)="Ich habe sofort nach dem Aufwachen das Licht angemacht."
label(data$leba_weekly_complete)="Complete?"
label(data$screening_scores_leba_weekly_timestamp)="Survey Timestamp"
label(data$leba_sc1_bluefilter_v2)="(4.1) LEBA: Subscore F1: Blaufilter"
label(data$leba_sc2_timeoutside_v2)="(4.2) LEBA: Subscore F2: Zeit draussen"
label(data$leba_sc3_screentime_v2)="(4.3) LEBA: Subscore F3: Bildschirmzeit im Bett"
label(data$leba_sc4_lightbeforesleep_v2)="(4.4) LEBA: Subscore F4: Licht vor Schlafenszeit"
label(data$leba_sc5_lightdaytime_v2)="(4.5) LEBA: Subscore F5: Licht tagsüber"
label(data$screening_scores_leba_weekly_complete)="Complete?"
label(data$leba_end_timestamp)="Survey Timestamp"
label(data$leba_f1_01)="Ich habe tagsüber in Innenräumen eine Brille mit Blaulichtfilter, eine orange-getönte und/oder rot-getönte Brille getragen."
label(data$leba_f1_02)="Ich habe tagsüber draußen eine Brille mit Blaulichtfilter, eine orange-getönte und/oder rot-getönte Brille getragen."
label(data$leba_f1_03)="Ich habe innerhalb einer Stunde, bevor ich einschlafen wollte, eine Brille mit Blaulichtfilter, eine orange-getönte und/oder rot-getönte Brille getragen."
label(data$leba_f2_04)="Ich habe pro Tag insgesamt 30 Minuten oder weniger draußen verbracht."
label(data$leba_f2_05)="Ich habe pro Tag insgesamt zwischen 30 Minuten und einer Stunde draußen verbracht."
label(data$leba_f2_06)="Ich habe pro Tag insgesamt zwischen einer und drei Stunden draußen verbracht."
label(data$leba_f2_07)="Ich habe pro Tag insgesamt mehr als drei Stunden draußen verbracht. "
label(data$leba_f2_08)="Ich habe so viel Zeit wie möglich draußen verbracht."
label(data$leba_f2_09)="Ich habe innerhalb von zwei Stunden nach dem Aufwachen draußen Sport oder einen Spaziergang gemacht."
label(data$leba_f3_10)="Ich habe innerhalb einer Stunde, bevor ich einschlafen wollte, mein Handy verwendet."
label(data$leba_f3_11)="Ich habe sofort nach dem Aufwachen auf den Bildschirm meines Handys geschaut."
label(data$leba_f3_12)="Wenn ich nachts aufgewacht bin, habe ich auf mein Handy geschaut."
label(data$leba_f3_13)="Ich habe innerhalb einer Stunde, bevor ich einschlafen wollte, auf meine Smartwatch geschaut."
label(data$leba_f3_14)="Wenn ich nachts aufgewacht bin, habe ich auf meine Smartwatch geschaut."
label(data$leba_f4_15)="Ich habe innerhalb einer Stunde, bevor ich einschlafen wollte, den Bildschirm meines Handys gedimmt."
label(data$leba_f4_16)="Ich habe innerhalb einer Stunde, bevor ich einschlafen wollte, eine Blaulichtfilter-App für meinen Computerbildschirm genutzt."
label(data$leba_f4_17)="Wenn ich nachts aufgestanden bin, habe ich so wenig Licht wie möglich genutzt."
label(data$leba_f4_18)="Ich habe innerhalb einer Stunde, bevor ich einschlafen wollte, den Computerbildschirm gedimmt."
label(data$leba_f5_19)="Ich habe einstellbare Lichtsysteme genutzt, um gesunde Lichtverhältnisse zu schaffen."
label(data$leba_f5_20)="Ich habe spezielle LED-Leuchten genutzt, um gesunde Lichtverhältnisse zu schaffen."
label(data$leba_f5_21)="Ich habe eine Leselampe für Tätigkeiten genutzt, die Konzentration erfordern."
label(data$leba_f5_22)="Ich habe einen Lichtwecker mit Sonnenaufgangssimulation genutzt."
label(data$leba_f5_23)="Ich habe sofort nach dem Aufwachen das Licht angemacht."
label(data$leba_end_complete)="Complete?"
label(data$screening_scores_leba_end_timestamp)="Survey Timestamp"
label(data$leba_sc1_bluefilter)="(4.1) LEBA: Subscore F1: Blaufilter"
label(data$leba_sc2_timeoutside)="(4.2) LEBA: Subscore F2: Zeit draussen"
label(data$leba_sc3_screentime)="(4.3) LEBA: Subscore F3: Bildschirmzeit im Bett"
label(data$leba_sc4_lightbeforesleep)="(4.4) LEBA: Subscore F4: Licht vor Schlafenszeit"
label(data$leba_sc5_lightdaytime)="(4.5) LEBA: Subscore F5: Licht tagsüber"
label(data$screening_scores_leba_end_complete)="Complete?"
label(data$psqi_timestamp)="Survey Timestamp"
label(data$psqi_q1_bedtime)="Wann bist Du während der letzten vier Wochen gewöhnlich abends zu Bett gegangen?"
label(data$psqi_q2_sleeptime)="Wie lange hat es während der letzten vier Wochen gewöhnlich gedauert, bis Du nachts eingeschlafen bist?"
label(data$psqi_q3_getuptime)="Wann bist Du während der letzten vier Wochen gewöhnlich morgens aufgestanden?"
label(data$psqi_q4_sleephrs)="Wie viele Stunden hast Du während der letzten vier Wochen pro Nacht tatsächlich geschlafen?   Anmerkung: Das muss nicht mit der Anzahl der Stunden übereinstimmen, die Du im Bett verbracht hast."
label(data$psqi_q5a_notfallasleep)="... Du nicht innerhalb von 30 Minuten einschlafen konntest?"
label(data$psqi_q5b_earlyawake)="... Du mitten in der Nacht oder früh morgens aufgewacht bist?"
label(data$psqi_q5c_wc)="... Du aufstehen musstest, um zur Toilette zu gehen?"
label(data$psqi_q5d_breath)="... Du Beschwerden beim Atmen hattest?"
label(data$psqi_q5e_snore)="... Du husten musstest oder laut geschnarcht hast?"
label(data$psqi_q5f_cold)="... Dir zu kalt war?"
label(data$psqi_q5g_warm)="... Dir zu warm war?"
label(data$psqi_q5h_dream)="... Du schlecht geträumt hast?"
label(data$psqi_q5i_pain)="... Du Schmerzen hattest?"
label(data$psqi_q5j_other)="aus anderen Gründen? (bitte unten beschreiben)"
label(data$psqi_q5j_other_descr)="Du hast andere Gründe angegeben. Bitte beschreibe diese."
label(data$psqi_q6_sleepquality)="Wie würdest Du insgesamt die Qualität Deines Schlafes während der letzten vier Wochen beurteilen?"
label(data$psqi_q7_sleepmed)="Wie oft hast Du während der letzten vier Wochen Schlafmittel eingenommen (vom Arzt verschriebene oder frei verkäufliche)?"
label(data$psqi_q8_staywake)="Wie oft hattest Du während der letzten vier Wochen Schwierigkeiten wach zubleiben, etwa beim Autofahren, beim Essen oder bei gesellschaftlichen Anlässen?"
label(data$psqi_q9_dailytasks)="Hattest Du während der letzten vier Wochen Probleme, mit genügend Schwung die üblichen Alltagsaufgaben zu erledigen?"
label(data$psqi_q10_bedpartner)="Schläfst Du alleine im Zimmer?"
label(data$psqi_q10a_snoreloud)="Lautes Schnarchen"
label(data$psqi_q10b_apnea)="Lange Atempausen während des Schlafes"
label(data$psqi_q10c_rlgs)="Zucken oder ruckartige Bewegungen der Beine während des Schlafes"
label(data$psqi_q10d_confus)="Nächtliche Phasen von Verwirrtheit oder Desorientierung während des Schlafes"
label(data$psqi_q10e_unrest)="Andere Formen von Unruhe während des Schlafes (bitte unten beschreiben)"
label(data$psqi_q10e_unrest_descr)="Du hast andere Formen von Unruhe angegeben. Bitte beschreibe diese."
label(data$psqi_complete)="Complete?"
label(data$screening_scores_psqi_1_timestamp)="Survey Timestamp"
label(data$psqi_sc1_sleepquality)="Subscale 1 (subjective sleep quality)"
label(data$psqi_sc2_calc1)="Calculation of subscale 2 (sleep latency)"
label(data$psqi_sc2_sleeplatency)="Subscale 2 (sleep latency)"
label(data$psqi_sc3_calc1)="Calculation of subscale 3 (sleep duration)"
label(data$psqi_sc3_sleepduration)="Subscale 3 (sleep duration)"
label(data$psqi_sc4_calc1_sleephrs)="Calculation of subscale 4 (sleeptime in hours)"
label(data$psqi_sc4_calc2_getuptime)="Calculation of subscale 4 (get up time)"
label(data$psqi_sc4_calc3_bedtime)="Calculation of subscale 4 (bedtime)"
label(data$psqi_sc4_calc4_hrsinbed)="Calculation of subscale 4 (number of hours spent in bed)"
label(data$psqi_sc4_calc5_efficiency)="Calculation of subscale 4 (sleep efficiency)"
label(data$psqi_sc4_sleepefficiency)="Subscale 4 (sleep efficiency)"
label(data$psqi_sc5_calc1)="Calculation of subscale 5 (sleep disorders)"
label(data$psqi_sc5_sleepdisorders)="Subscale 5 (sleep disorders)"
label(data$psqi_sc6_sleepmed)="Subscale 6 (sleep medication)"
label(data$psqi_sc7_calc1)="Calculation of subscale 7 (daytime sleepiness)"
label(data$psqi_sc7_daytimesleepiness)="Subscale 7 (daytime sleepiness)"
label(data$psqi_sc0_total)="(4) PSQI total score "
label(data$psqi_validation)="PSQI validation total score"
label(data$screening_scores_psqi_1_complete)="Complete?"
label(data$screening_scores_psqi_2_timestamp)="Survey Timestamp"
label(data$psqi_sc1_sleepquality_v2)="Subscale 1 (subjective sleep quality)"
label(data$psqi_sc2_calc1_v2)="Calculation of subscale 2 (sleep latency)"
label(data$psqi_sc2_sleeplatency_v2)="Subscale 2 (sleep latency)"
label(data$psqi_sc3_calc1_v2)="Calculation of subscale 3 (sleep duration)"
label(data$psqi_sc3_sleepduration_v2)="Subscale 3 (sleep duration)"
label(data$psqi_sc4_calc1_sleephrs_v2)="Calculation of subscale 4 (sleeptime in hours)"
label(data$psqi_sc4_calc2_getuptime_v2)="Calculation of subscale 4 (get up time)"
label(data$psqi_sc4_calc3_bedtime_v2)="Calculation of subscale 4 (bedtime)"
label(data$psqi_sc4_calc4_hrsinbed_v2)="Calculation of subscale 4 (number of hours spent in bed)"
label(data$psqi_sc4_calc5_efficiency_v2)="Calculation of subscale 4 (sleep efficiency)"
label(data$psqi_sc4_sleepefficiency_v2)="Subscale 4 (sleep efficiency)"
label(data$psqi_sc5_calc1_v2)="Calculation of subscale 5 (sleep disorders)"
label(data$psqi_sc5_sleepdisorders_v2)="Subscale 5 (sleep disorders)"
label(data$psqi_sc6_sleepmed_v2)="Subscale 6 (sleep medication)"
label(data$psqi_sc7_calc1_v2)="Calculation of subscale 7 (daytime sleepiness)"
label(data$psqi_sc7_daytimesleepiness_v2)="Subscale 7 (daytime sleepiness)"
label(data$psqi_sc0_total_v2)="(4) PSQI total score "
label(data$psqi_validation_v2)="PSQI validation total score"
label(data$screening_scores_psqi_2_complete)="Complete?"
label(data$besttigung_datendownload_timestamp)="Survey Timestamp"
label(data$download)="Wurden die Daten heruntergeladen?"
label(data$besttigung_datendownload_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$redcap_event_name.factor = factor(data$redcap_event_name,levels=c("tag_1_psqi_arm_1","tag_4_leba_do_arm_1","tag_7_leba_so_arm_1","tag_11_leba_do_arm_1","tag_14_leba_so_arm_1","tag_15_data_downlo_arm_1","tag_18_leba_do_arm_1","tag_21_leba_so_arm_1","tag_25_leba_do_arm_1","tag_28_leba_so_arm_1","tag_31_data_downlo_arm_1","tag_31_leba_psqi_arm_1"))
data$teilnahme.factor = factor(data$teilnahme,levels=c("1","2"))
data$registrierung_fr_studie_complete.factor = factor(data$registrierung_fr_studie_complete,levels=c("0","1","2"))
data$leba_f1_01_2.factor = factor(data$leba_f1_01_2,levels=c("1","2","3","4","5"))
data$leba_f1_02_2.factor = factor(data$leba_f1_02_2,levels=c("1","2","3","4","5"))
data$leba_f1_03_2.factor = factor(data$leba_f1_03_2,levels=c("1","2","3","4","5"))
data$leba_f2_04_2.factor = factor(data$leba_f2_04_2,levels=c("1","2","3","4","5"))
data$leba_f2_05_2.factor = factor(data$leba_f2_05_2,levels=c("1","2","3","4","5"))
data$leba_f2_06_2.factor = factor(data$leba_f2_06_2,levels=c("1","2","3","4","5"))
data$leba_f2_07_2.factor = factor(data$leba_f2_07_2,levels=c("1","2","3","4","5"))
data$leba_f2_08_2.factor = factor(data$leba_f2_08_2,levels=c("1","2","3","4","5"))
data$leba_f2_09_2.factor = factor(data$leba_f2_09_2,levels=c("1","2","3","4","5"))
data$leba_f3_10_2.factor = factor(data$leba_f3_10_2,levels=c("1","2","3","4","5"))
data$leba_f3_11_2.factor = factor(data$leba_f3_11_2,levels=c("1","2","3","4","5"))
data$leba_f3_12_2.factor = factor(data$leba_f3_12_2,levels=c("1","2","3","4","5"))
data$leba_f3_13_2.factor = factor(data$leba_f3_13_2,levels=c("1","2","3","4","5"))
data$leba_f3_14_2.factor = factor(data$leba_f3_14_2,levels=c("1","2","3","4","5"))
data$leba_f4_15_2.factor = factor(data$leba_f4_15_2,levels=c("1","2","3","4","5"))
data$leba_f4_16_2.factor = factor(data$leba_f4_16_2,levels=c("1","2","3","4","5"))
data$leba_f4_17_2.factor = factor(data$leba_f4_17_2,levels=c("1","2","3","4","5"))
data$leba_f4_18_2.factor = factor(data$leba_f4_18_2,levels=c("1","2","3","4","5"))
data$leba_f5_19_2.factor = factor(data$leba_f5_19_2,levels=c("1","2","3","4","5"))
data$leba_f5_20_2.factor = factor(data$leba_f5_20_2,levels=c("1","2","3","4","5"))
data$leba_f5_21_2.factor = factor(data$leba_f5_21_2,levels=c("1","2","3","4","5"))
data$leba_f5_22_2.factor = factor(data$leba_f5_22_2,levels=c("1","2","3","4","5"))
data$leba_f5_23_2.factor = factor(data$leba_f5_23_2,levels=c("1","2","3","4","5"))
data$leba_weekly_complete.factor = factor(data$leba_weekly_complete,levels=c("0","1","2"))
data$screening_scores_leba_weekly_complete.factor = factor(data$screening_scores_leba_weekly_complete,levels=c("0","1","2"))
data$leba_f1_01.factor = factor(data$leba_f1_01,levels=c("1","2","3","4","5"))
data$leba_f1_02.factor = factor(data$leba_f1_02,levels=c("1","2","3","4","5"))
data$leba_f1_03.factor = factor(data$leba_f1_03,levels=c("1","2","3","4","5"))
data$leba_f2_04.factor = factor(data$leba_f2_04,levels=c("1","2","3","4","5"))
data$leba_f2_05.factor = factor(data$leba_f2_05,levels=c("1","2","3","4","5"))
data$leba_f2_06.factor = factor(data$leba_f2_06,levels=c("1","2","3","4","5"))
data$leba_f2_07.factor = factor(data$leba_f2_07,levels=c("1","2","3","4","5"))
data$leba_f2_08.factor = factor(data$leba_f2_08,levels=c("1","2","3","4","5"))
data$leba_f2_09.factor = factor(data$leba_f2_09,levels=c("1","2","3","4","5"))
data$leba_f3_10.factor = factor(data$leba_f3_10,levels=c("1","2","3","4","5"))
data$leba_f3_11.factor = factor(data$leba_f3_11,levels=c("1","2","3","4","5"))
data$leba_f3_12.factor = factor(data$leba_f3_12,levels=c("1","2","3","4","5"))
data$leba_f3_13.factor = factor(data$leba_f3_13,levels=c("1","2","3","4","5"))
data$leba_f3_14.factor = factor(data$leba_f3_14,levels=c("1","2","3","4","5"))
data$leba_f4_15.factor = factor(data$leba_f4_15,levels=c("1","2","3","4","5"))
data$leba_f4_16.factor = factor(data$leba_f4_16,levels=c("1","2","3","4","5"))
data$leba_f4_17.factor = factor(data$leba_f4_17,levels=c("1","2","3","4","5"))
data$leba_f4_18.factor = factor(data$leba_f4_18,levels=c("1","2","3","4","5"))
data$leba_f5_19.factor = factor(data$leba_f5_19,levels=c("1","2","3","4","5"))
data$leba_f5_20.factor = factor(data$leba_f5_20,levels=c("1","2","3","4","5"))
data$leba_f5_21.factor = factor(data$leba_f5_21,levels=c("1","2","3","4","5"))
data$leba_f5_22.factor = factor(data$leba_f5_22,levels=c("1","2","3","4","5"))
data$leba_f5_23.factor = factor(data$leba_f5_23,levels=c("1","2","3","4","5"))
data$leba_end_complete.factor = factor(data$leba_end_complete,levels=c("0","1","2"))
data$screening_scores_leba_end_complete.factor = factor(data$screening_scores_leba_end_complete,levels=c("0","1","2"))
data$psqi_q5a_notfallasleep.factor = factor(data$psqi_q5a_notfallasleep,levels=c("0","1","2","3"))
data$psqi_q5b_earlyawake.factor = factor(data$psqi_q5b_earlyawake,levels=c("0","1","2","3"))
data$psqi_q5c_wc.factor = factor(data$psqi_q5c_wc,levels=c("0","1","2","3"))
data$psqi_q5d_breath.factor = factor(data$psqi_q5d_breath,levels=c("0","1","2","3"))
data$psqi_q5e_snore.factor = factor(data$psqi_q5e_snore,levels=c("0","1","2","3"))
data$psqi_q5f_cold.factor = factor(data$psqi_q5f_cold,levels=c("0","1","2","3"))
data$psqi_q5g_warm.factor = factor(data$psqi_q5g_warm,levels=c("0","1","2","3"))
data$psqi_q5h_dream.factor = factor(data$psqi_q5h_dream,levels=c("0","1","2","3"))
data$psqi_q5i_pain.factor = factor(data$psqi_q5i_pain,levels=c("0","1","2","3"))
data$psqi_q5j_other.factor = factor(data$psqi_q5j_other,levels=c("0","1","2","3"))
data$psqi_q6_sleepquality.factor = factor(data$psqi_q6_sleepquality,levels=c("0","1","2","3"))
data$psqi_q7_sleepmed.factor = factor(data$psqi_q7_sleepmed,levels=c("0","1","2","3"))
data$psqi_q8_staywake.factor = factor(data$psqi_q8_staywake,levels=c("0","1","2","3"))
data$psqi_q9_dailytasks.factor = factor(data$psqi_q9_dailytasks,levels=c("0","1","2","3"))
data$psqi_q10_bedpartner.factor = factor(data$psqi_q10_bedpartner,levels=c("0","1","2","3"))
data$psqi_q10a_snoreloud.factor = factor(data$psqi_q10a_snoreloud,levels=c("0","1","2","3"))
data$psqi_q10b_apnea.factor = factor(data$psqi_q10b_apnea,levels=c("0","1","2","3"))
data$psqi_q10c_rlgs.factor = factor(data$psqi_q10c_rlgs,levels=c("0","1","2","3"))
data$psqi_q10d_confus.factor = factor(data$psqi_q10d_confus,levels=c("0","1","2","3"))
data$psqi_q10e_unrest.factor = factor(data$psqi_q10e_unrest,levels=c("0","1","2","3"))
data$psqi_complete.factor = factor(data$psqi_complete,levels=c("0","1","2"))
data$screening_scores_psqi_1_complete.factor = factor(data$screening_scores_psqi_1_complete,levels=c("0","1","2"))
data$screening_scores_psqi_2_complete.factor = factor(data$screening_scores_psqi_2_complete,levels=c("0","1","2"))
data$download.factor = factor(data$download,levels=c("1","2"))
data$besttigung_datendownload_complete.factor = factor(data$besttigung_datendownload_complete,levels=c("0","1","2"))

levels(data$redcap_event_name.factor)=c("Tag 1 (PSQI)","Tag 4 (LEBA Do)","Tag 7 (LEBA So)","Tag 11 (LEBA Do)","Tag 14 (LEBA So)","Tag 15 (Data Download)","Tag 18 (LEBA Do)","Tag 21 (LEBA So)","Tag 25 (LEBA Do)","Tag 28 (LEBA So)","Tag 31 (Data Download)","Tag 31 (LEBA &PSQI)")
levels(data$teilnahme.factor)=c("Ja","Nein")
levels(data$registrierung_fr_studie_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$leba_f1_01_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f1_02_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f1_03_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f2_04_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f2_05_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f2_06_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f2_07_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f2_08_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f2_09_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f3_10_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f3_11_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f3_12_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f3_13_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f3_14_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f4_15_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f4_16_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f4_17_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f4_18_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f5_19_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f5_20_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f5_21_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f5_22_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f5_23_2.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_weekly_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$screening_scores_leba_weekly_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$leba_f1_01.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f1_02.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f1_03.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f2_04.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f2_05.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f2_06.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f2_07.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f2_08.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f2_09.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f3_10.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f3_11.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f3_12.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f3_13.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f3_14.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f4_15.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f4_16.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f4_17.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f4_18.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f5_19.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f5_20.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f5_21.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f5_22.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_f5_23.factor)=c("Nie","Selten","Manchmal","Oft","Immer")
levels(data$leba_end_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$screening_scores_leba_end_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$psqi_q5a_notfallasleep.factor)=c("während der letzten vier Wochen gar nicht","weniger als einmal pro Woche","einmal oder zweimal pro Woche","dreimal oder häufiger pro Woche")
levels(data$psqi_q5b_earlyawake.factor)=c("während der letzten vier Wochen gar nicht","weniger als einmal pro Woche","einmal oder zweimal pro Woche","dreimal oder häufiger pro Woche")
levels(data$psqi_q5c_wc.factor)=c("während der letzten vier Wochen gar nicht","weniger als einmal pro Woche","einmal oder zweimal pro Woche","dreimal oder häufiger pro Woche")
levels(data$psqi_q5d_breath.factor)=c("während der letzten vier Wochen gar nicht","weniger als einmal pro Woche","einmal oder zweimal pro Woche","dreimal oder häufiger pro Woche")
levels(data$psqi_q5e_snore.factor)=c("während der letzten vier Wochen gar nicht","weniger als einmal pro Woche","einmal oder zweimal pro Woche","dreimal oder häufiger pro Woche")
levels(data$psqi_q5f_cold.factor)=c("während der letzten vier Wochen gar nicht","weniger als einmal pro Woche","einmal oder zweimal pro Woche","dreimal oder häufiger pro Woche")
levels(data$psqi_q5g_warm.factor)=c("während der letzten vier Wochen gar nicht","weniger als einmal pro Woche","einmal oder zweimal pro Woche","dreimal oder häufiger pro Woche")
levels(data$psqi_q5h_dream.factor)=c("während der letzten vier Wochen gar nicht","weniger als einmal pro Woche","einmal oder zweimal pro Woche","dreimal oder häufiger pro Woche")
levels(data$psqi_q5i_pain.factor)=c("während der letzten vier Wochen gar nicht","weniger als einmal pro Woche","einmal oder zweimal pro Woche","dreimal oder häufiger pro Woche")
levels(data$psqi_q5j_other.factor)=c("während der letzten vier Wochen gar nicht","weniger als einmal pro Woche","einmal oder zweimal pro Woche","dreimal oder häufiger pro Woche")
levels(data$psqi_q6_sleepquality.factor)=c("sehr gut","ziemlich gut","ziemlich schlecht","sehr schlecht")
levels(data$psqi_q7_sleepmed.factor)=c("während der letzten vier Wochen gar nicht","weniger als einmal pro Woche","einmal oder zweimal pro Woche","dreimal oder häufiger pro Woche")
levels(data$psqi_q8_staywake.factor)=c("während der letzten vier Wochen gar nicht","weniger als einmal pro Woche","einmal oder zweimal pro Woche","dreimal oder häufiger pro Woche")
levels(data$psqi_q9_dailytasks.factor)=c("keine Probleme","kaum Probleme","etwas Probleme","grosse Probleme")
levels(data$psqi_q10_bedpartner.factor)=c("ja","ja, aber ein Partner/Mitbewohner schläft in einem anderen Zimmer","nein, der Partner schläft im selben Zimmer, aber nicht im selben Bett","nein, der Partner schläft im selben Bett")
levels(data$psqi_q10a_snoreloud.factor)=c("während der letzten vier Wochen gar nicht","weniger als einmal pro Woche","einmal oder zweimal pro Woche","dreimal oder häufiger pro Woche")
levels(data$psqi_q10b_apnea.factor)=c("während der letzten vier Wochen gar nicht","weniger als einmal pro Woche","einmal oder zweimal pro Woche","dreimal oder häufiger pro Woche")
levels(data$psqi_q10c_rlgs.factor)=c("während der letzten vier Wochen gar nicht","weniger als einmal pro Woche","einmal oder zweimal pro Woche","dreimal oder häufiger pro Woche")
levels(data$psqi_q10d_confus.factor)=c("während der letzten vier Wochen gar nicht","weniger als einmal pro Woche","einmal oder zweimal pro Woche","dreimal oder häufiger pro Woche")
levels(data$psqi_q10e_unrest.factor)=c("während der letzten vier Wochen gar nicht","weniger als einmal pro Woche","einmal oder zweimal pro Woche","dreimal oder häufiger pro Woche")
levels(data$psqi_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$screening_scores_psqi_1_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$screening_scores_psqi_2_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$download.factor)=c("Ja","Nein")
levels(data$besttigung_datendownload_complete.factor)=c("Incomplete","Unverified","Complete")
