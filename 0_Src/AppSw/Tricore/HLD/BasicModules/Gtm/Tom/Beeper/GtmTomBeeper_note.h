/*
 * Music_notes.h
 *
 *  Created on: 2018. 5L. 20.
 *      Author: bigbi_000
 */

#ifndef GTMTOMBEEPER_NOTE_H_
#define GTMTOMBEEPER_NOTE_H_

#include "GtmTomBeeper.h"
/*
 * Macros for beeper pitch
 * */
#define NOTE_A4				(440.0)
#define NOTE_AS4			(466.163762)
#define NOTE_BF4			(466.163762)
#define NOTE_B4				(493.883301)

#define NOTE_C5				(523.251131)
#define NOTE_CS5			(554.365262)
#define NOTE_DF5 			(554.365262)
#define NOTE_D5				(587.329536)
#define NOTE_DS5			(622.253967)
#define NOTE_EF5			(622.253967)
#define	NOTE_E5				(659.255114)
#define NOTE_F5				(698.456463)
#define NOTE_FS5			(739.988845)
#define NOTE_GF5			(739.988845)
#define NOTE_G5				(783.990872)
#define NOTE_GS5			(830.609395)
#define NOTE_AF5			(830.609395)
#define NOTE_A5				(880.0)
#define NOTE_AS5			(932.327523)
#define NOTE_BF5			(932.327523)
#define NOTE_B5				(987.766603)

#define NOTE_C6				(1046.502261)
#define NOTE_CS6			(1108.730524)
#define NOTE_D6				(1174.659072)
#define NOTE_DS6			(1244.507935)
#define NOTE_E6				(1318.510228)
#define NOTE_F6				(1396.912926)
#define NOTE_FS6			(1479.977691)
#define NOTE_G6				(1567.981744)
#define NOTE_GS6			(1661.218790)
#define NOTE_A6				(1760.0)

#define NOTE_C7			(2093.004522)

/*
 * Macros for beeper musical note.
 * */
#define HC5					{note_half, note_C5, FALSE}
#define HCS5				{note_half, note_Cs5, FALSE}
#define HDF5				{note_half, note_Cs5, FALSE}
#define HD5					{note_half, note_D5, FALSE}
#define HDS5				{note_half, note_Ds5, FALSE}
#define HEF5				{note_half, note_Ds5, FALSE}
#define HE5					{note_half, note_E5, FALSE}
#define HF5					{note_half, note_F5, FALSE}
#define HFS5				{note_half, note_Fs5, FALSE}
#define HGF5				{note_half, note_Fs5, FALSE}
#define HG5					{note_half, note_G5, FALSE}
#define HGS5				{note_half, note_Gs5, FALSE}
#define HAF5				{note_half, note_Gs5, FALSE}
#define HA5					{note_half, note_A5, FALSE}
#define HAS5				{note_half, note_As5, FALSE}
#define HBF5				{note_half, note_As5, FALSE}
#define HB5					{note_half, note_B5, FALSE}
#define HC6					{note_half, note_C6, FALSE}
#define HCS6				{note_half, note_Cs6, FALSE}
#define HDF6				{note_half, note_Cs6, FALSE}
#define HD6					{note_half, note_D6, FALSE}
#define HDS6				{note_half, note_Ds6, FALSE}
#define HEF6				{note_half, note_Ds6, FALSE}
#define HE6					{note_half, note_E6, FALSE}
#define HF6					{note_half, note_F6, FALSE}
#define HFS6				{note_half, note_Fs6, FALSE}
#define HG6					{note_half, note_G6, FALSE}
#define HGS6				{note_half, note_Gs6, FALSE}
#define HA6					{note_half, note_A6, FALSE}

#define QC5					{note_quarter, note_C5, FALSE}
#define QCS5				{note_quarter, note_Cs5, FALSE}
#define QDF5				{note_quarter, note_Cs5, FALSE}
#define QD5					{note_quarter, note_D5, FALSE}
#define QDS5				{note_quarter, note_Ds5, FALSE}
#define QEF5				{note_quarter, note_Ds5, FALSE}
#define QE5					{note_quarter, note_E5, FALSE}
#define QF5					{note_quarter, note_F5, FALSE}
#define QFS5				{note_quarter, note_Fs5, FALSE}
#define QGF5				{note_quarter, note_Fs5, FALSE}
#define QG5					{note_quarter, note_G5, FALSE}
#define QGS5				{note_quarter, note_Gs5, FALSE}
#define QAF5				{note_quarter, note_Gs5, FALSE}
#define QA5					{note_quarter, note_A5, FALSE}
#define QAS5				{note_quarter, note_As5, FALSE}
#define QBF5				{note_quarter, note_As5, FALSE}
#define QB5					{note_quarter, note_B5, FALSE}
#define QC6					{note_quarter, note_C6, FALSE}
#define QCS6				{note_quarter, note_Cs6, FALSE}
#define QDF6				{note_quarter, note_Cs6, FALSE}
#define QD6					{note_quarter, note_D6, FALSE}
#define QDS6				{note_quarter, note_Ds6, FALSE}
#define QEF6				{note_quarter, note_Ds6, FALSE}
#define QE6					{note_quarter, note_E6, FALSE}
#define QF6					{note_quarter, note_F6, FALSE}
#define QFS6				{note_quarter, note_Fs6, FALSE}
#define QG6					{note_quarter, note_G6, FALSE}
#define QGS6				{note_quarter, note_Gs6, FALSE}
#define QA6					{note_quarter, note_A6, FALSE}

#define EC5					{note_eighth, note_C5, FALSE}
#define ECS5				{note_eighth, note_Cs5, FALSE}
#define EDF5				{note_eighth, note_Cs5, FALSE}
#define ED5					{note_eighth, note_D5, FALSE}
#define EDS5				{note_eighth, note_Ds5, FALSE}
#define EEF5				{note_eighth, note_Ds5, FALSE}
#define EE5					{note_eighth, note_E5, FALSE}
#define EF5					{note_eighth, note_F5, FALSE}
#define EFS5				{note_eighth, note_Fs5, FALSE}
#define EGF5				{note_eighth, note_Fs5, FALSE}
#define EG5					{note_eighth, note_G5, FALSE}
#define EGS5				{note_eighth, note_Gs5, FALSE}
#define EAF5				{note_eighth, note_Gs5, FALSE}
#define EA5					{note_eighth, note_A5, FALSE}
#define EAS5				{note_eighth, note_As5, FALSE}
#define EBF5				{note_eighth, note_As5, FALSE}
#define EB5					{note_eighth, note_B5, FALSE}
#define EC6					{note_eighth, note_C6, FALSE}
#define ECS6				{note_eighth, note_Cs6, FALSE}
#define EDF6				{note_eighth, note_Cs6, FALSE}
#define ED6					{note_eighth, note_D6, FALSE}
#define EDS6				{note_eighth, note_Ds6, FALSE}
#define EEF6				{note_eighth, note_Ds6, FALSE}
#define EE6					{note_eighth, note_E6, FALSE}
#define EF6					{note_eighth, note_F6, FALSE}
#define EFS6				{note_eighth, note_Fs6, FALSE}
#define EG6					{note_eighth, note_G6, FALSE}
#define EGS6				{note_eighth, note_Gs6, FALSE}
#define EA6					{note_eighth, note_A6, FALSE}

#define SC5					{note_sixteenth, note_C5, FALSE}
#define SCS5				{note_sixteenth, note_Cs5, FALSE}
#define SDF5				{note_sixteenth, note_Cs5, FALSE}
#define SD5					{note_sixteenth, note_D5, FALSE}
#define SDS5				{note_sixteenth, note_Ds5, FALSE}
#define SEF5				{note_sixteenth, note_Ds5, FALSE}
#define SE5					{note_sixteenth, note_E5, FALSE}
#define SF5					{note_sixteenth, note_F5, FALSE}
#define SFS5				{note_sixteenth, note_Fs5, FALSE}
#define SGF5				{note_sixteenth, note_Fs5, FALSE}
#define SG5					{note_sixteenth, note_G5, FALSE}
#define SGS5				{note_sixteenth, note_Gs5, FALSE}
#define SAF5				{note_sixteenth, note_Gs5, FALSE}
#define SA5					{note_sixteenth, note_A5, FALSE}
#define SAS5				{note_sixteenth, note_As5, FALSE}
#define SBF5				{note_sixteenth, note_As5, FALSE}
#define SB5					{note_sixteenth, note_B5, FALSE}
#define SC6					{note_sixteenth, note_C6, FALSE}
#define SCS6				{note_sixteenth, note_Cs6, FALSE}
#define SDF6				{note_sixteenth, note_Cs6, FALSE}
#define SD6					{note_sixteenth, note_D6, FALSE}
#define SDS6				{note_sixteenth, note_Ds6, FALSE}
#define SEF6				{note_sixteenth, note_Ds6, FALSE}
#define SE6					{note_sixteenth, note_E6, FALSE}
#define SF6					{note_sixteenth, note_F6, FALSE}
#define SFS6				{note_sixteenth, note_Fs6, FALSE}
#define SG6					{note_sixteenth, note_G6, FALSE}
#define SGS6				{note_sixteenth, note_Gs6, FALSE}
#define SA6					{note_sixteenth, note_A6, FALSE}

#define TC5					{note_thirtysecond, note_C5, FALSE}
#define TCS5				{note_thirtysecond, note_Cs5, FALSE}
#define TDF5				{note_thirtysecond, note_Cs5, FALSE}
#define TD5					{note_thirtysecond, note_D5, FALSE}
#define TDS5				{note_thirtysecond, note_Ds5, FALSE}
#define TEF5				{note_thirtysecond, note_Ds5, FALSE}
#define TE5					{note_thirtysecond, note_E5, FALSE}
#define TF5					{note_thirtysecond, note_F5, FALSE}
#define TFS5				{note_thirtysecond, note_Fs5, FALSE}
#define TGF5				{note_thirtysecond, note_Fs5, FALSE}
#define TG5					{note_thirtysecond, note_G5, FALSE}
#define TGS5				{note_thirtysecond, note_Gs5, FALSE}
#define TAF5				{note_thirtysecond, note_Gs5, FALSE}
#define TA5					{note_thirtysecond, note_A5, FALSE}
#define TAS5				{note_thirtysecond, note_As5, FALSE}
#define TBF5				{note_thirtysecond, note_As5, FALSE}
#define TB5					{note_thirtysecond, note_B5, FALSE}
#define TC6					{note_thirtysecond, note_C6, FALSE}
#define TCS6				{note_thirtysecond, note_Cs6, FALSE}
#define TDF6				{note_thirtysecond, note_Cs6, FALSE}
#define TD6					{note_thirtysecond, note_D6, FALSE}
#define TDS6				{note_thirtysecond, note_Ds6, FALSE}
#define TEF6				{note_thirtysecond, note_Ds6, FALSE}
#define TE6					{note_thirtysecond, note_E6, FALSE}
#define TF6					{note_thirtysecond, note_F6, FALSE}
#define TFS6				{note_thirtysecond, note_Fs6, FALSE}
#define TG6					{note_thirtysecond, note_G6, FALSE}
#define TGS6				{note_thirtysecond, note_Gs6, FALSE}
#define TA6					{note_thirtysecond, note_A6, FALSE}

#define HC5L					{note_half, note_C5, TRUE}
#define HCS5L				{note_half, note_Cs5, TRUE}
#define HDF5L				{note_half, note_Cs5, TRUE}
#define HD5L					{note_half, note_D5, TRUE}
#define HDS5L				{note_half, note_Ds5, TRUE}
#define HEF5L				{note_half, note_Ds5, TRUE}
#define HE5L					{note_half, note_E5, TRUE}
#define HF5L					{note_half, note_F5, TRUE}
#define HFS5L				{note_half, note_Fs5, TRUE}
#define HGF5L				{note_half, note_Fs5, TRUE}
#define HG5L					{note_half, note_G5, TRUE}
#define HGS5L				{note_half, note_Gs5, TRUE}
#define HAF5L				{note_half, note_Gs5, TRUE}
#define HA5L					{note_half, note_A5, TRUE}
#define HAS5L				{note_half, note_As5, TRUE}
#define HBF5L				{note_half, note_As5, TRUE}
#define HB5L					{note_half, note_B5, TRUE}
#define HC6L					{note_half, note_C6, TRUE}
#define HCS6L				{note_half, note_Cs6, TRUE}
#define HDF6L				{note_half, note_Cs6, TRUE}
#define HD6L					{note_half, note_D6, TRUE}
#define HDS6L				{note_half, note_Ds6, TRUE}
#define HEF6L				{note_half, note_Ds6, TRUE}
#define HE6L				{note_half, note_E6, TRUE}
#define HF6L				{note_half, note_F6, TRUE}
#define HFS6L				{note_half, note_Fs6, TRUE}
#define HG6L					{note_half, note_G6, TRUE}
#define HGS6L				{note_half, note_Gs6, TRUE}
#define HA6L					{note_half, note_A6, TRUE}

#define QC5L					{note_quarter, note_C5, TRUE}
#define QCS5L				{note_quarter, note_Cs5, TRUE}
#define QDF5L				{note_quarter, note_Cs5, TRUE}
#define QD5L					{note_quarter, note_D5, TRUE}
#define QDS5L				{note_quarter, note_Ds5, TRUE}
#define QEF5L				{note_quarter, note_Ds5, TRUE}
#define QE5L					{note_quarter, note_E5, TRUE}
#define QF5L					{note_quarter, note_F5, TRUE}
#define QFS5L				{note_quarter, note_Fs5, TRUE}
#define QGF5L				{note_quarter, note_Fs5, TRUE}
#define QG5L					{note_quarter, note_G5, TRUE}
#define QGS5L				{note_quarter, note_Gs5, TRUE}
#define QAF5L				{note_quarter, note_Gs5, TRUE}
#define QA5L					{note_quarter, note_A5, TRUE}
#define QAS5L				{note_quarter, note_As5, TRUE}
#define QBF5L				{note_quarter, note_As5, TRUE}
#define QB5L					{note_quarter, note_B5, TRUE}
#define QC6L					{note_quarter, note_C6, TRUE}
#define QCS6L				{note_quarter, note_Cs6, TRUE}
#define QDF6L				{note_quarter, note_Cs6, TRUE}
#define QD6L					{note_quarter, note_D6, TRUE}
#define QDS6L				{note_quarter, note_Ds6, TRUE}
#define QEF6L				{note_quarter, note_Ds6, TRUE}
#define QE6L					{note_quarter, note_E6, TRUE}
#define QF6L					{note_quarter, note_F6, TRUE}
#define QFS6L				{note_quarter, note_Fs6, TRUE}
#define QG6L					{note_quarter, note_G6, TRUE}
#define QGS6L				{note_quarter, note_Gs6, TRUE}
#define QA6L					{note_quarter, note_A6, TRUE}

#define EC5L					{note_eighth, note_C5, TRUE}
#define ECS5L				{note_eighth, note_Cs5, TRUE}
#define EDF5L				{note_eighth, note_Cs5, TRUE}
#define ED5L					{note_eighth, note_D5, TRUE}
#define EDS5L				{note_eighth, note_Ds5, TRUE}
#define EEF5L				{note_eighth, note_Ds5, TRUE}
#define EE5L					{note_eighth, note_E5, TRUE}
#define EF5L					{note_eighth, note_F5, TRUE}
#define EFS5L				{note_eighth, note_Fs5, TRUE}
#define EGF5L				{note_eighth, note_Fs5, TRUE}
#define EG5L					{note_eighth, note_G5, TRUE}
#define EGS5L				{note_eighth, note_Gs5, TRUE}
#define EAF5L				{note_eighth, note_Gs5, TRUE}
#define EA5L					{note_eighth, note_A5, TRUE}
#define EAS5L				{note_eighth, note_As5, TRUE}
#define EBF5L				{note_eighth, note_As5, TRUE}
#define EB5L					{note_eighth, note_B5, TRUE}
#define EC6L					{note_eighth, note_C6, TRUE}
#define ECS6L				{note_eighth, note_Cs6, TRUE}
#define EDF6L				{note_eighth, note_Cs6, TRUE}
#define ED6L					{note_eighth, note_D6, TRUE}
#define EDS6L				{note_eighth, note_Ds6, TRUE}
#define EEF6L				{note_eighth, note_Ds6, TRUE}
#define EE6L					{note_eighth, note_E6, TRUE}
#define EF6L					{note_eighth, note_F6, TRUE}
#define EFS6L				{note_eighth, note_Fs6, TRUE}
#define EG6L					{note_eighth, note_G6, TRUE}
#define EGS6L				{note_eighth, note_Gs6, TRUE}
#define EA6L					{note_eighth, note_A6, TRUE}

#define SC5L					{note_sixteenth, note_C5, TRUE}
#define SCS5L				{note_sixteenth, note_Cs5, TRUE}
#define SDF5L				{note_sixteenth, note_Cs5, TRUE}
#define SD5L					{note_sixteenth, note_D5, TRUE}
#define SDS5L				{note_sixteenth, note_Ds5, TRUE}
#define SEF5L				{note_sixteenth, note_Ds5, TRUE}
#define SE5L					{note_sixteenth, note_E5, TRUE}
#define SF5L					{note_sixteenth, note_F5, TRUE}
#define SFS5L				{note_sixteenth, note_Fs5, TRUE}
#define SGF5L				{note_sixteenth, note_Fs5, TRUE}
#define SG5L					{note_sixteenth, note_G5, TRUE}
#define SGS5L				{note_sixteenth, note_Gs5, TRUE}
#define SAF5L				{note_sixteenth, note_Gs5, TRUE}
#define SA5L					{note_sixteenth, note_A5, TRUE}
#define SAS5L				{note_sixteenth, note_As5, TRUE}
#define SBF5L				{note_sixteenth, note_As5, TRUE}
#define SB5L					{note_sixteenth, note_B5, TRUE}
#define SC6L					{note_sixteenth, note_C6, TRUE}
#define SCS6L				{note_sixteenth, note_Cs6, TRUE}
#define SDF6L				{note_sixteenth, note_Cs6, TRUE}
#define SD6L					{note_sixteenth, note_D6, TRUE}
#define SDS6L				{note_sixteenth, note_Ds6, TRUE}
#define SEF6L				{note_sixteenth, note_Ds6, TRUE}
#define SE6L					{note_sixteenth, note_E6, TRUE}
#define SF6L					{note_sixteenth, note_F6, TRUE}
#define SFS6L				{note_sixteenth, note_Fs6, TRUE}
#define SG6L					{note_sixteenth, note_G6, TRUE}
#define SGS6L				{note_sixteenth, note_Gs6, TRUE}
#define SA6L					{note_sixteenth, note_A6, TRUE}

#define TC5L					{note_thirtysecond, note_C5, TRUE}
#define TCS5L				{note_thirtysecond, note_Cs5, TRUE}
#define TDF5L				{note_thirtysecond, note_Cs5, TRUE}
#define TD5L					{note_thirtysecond, note_D5, TRUE}
#define TDS5L				{note_thirtysecond, note_Ds5, TRUE}
#define TEF5L				{note_thirtysecond, note_Ds5, TRUE}
#define TE5L					{note_thirtysecond, note_E5, TRUE}
#define TF5L					{note_thirtysecond, note_F5, TRUE}
#define TFS5L				{note_thirtysecond, note_Fs5, TRUE}
#define TGF5L				{note_thirtysecond, note_Fs5, TRUE}
#define TG5L					{note_thirtysecond, note_G5, TRUE}
#define TGS5L				{note_thirtysecond, note_Gs5, TRUE}
#define TAF5L				{note_thirtysecond, note_Gs5, TRUE}
#define TA5L					{note_thirtysecond, note_A5, TRUE}
#define TAS5L				{note_thirtysecond, note_As5, TRUE}
#define TBF5L				{note_thirtysecond, note_As5, TRUE}
#define TB5L					{note_thirtysecond, note_B5, TRUE}
#define TC6L					{note_thirtysecond, note_C6, TRUE}
#define TCS6L				{note_thirtysecond, note_Cs6, TRUE}
#define TDF6L				{note_thirtysecond, note_Cs6, TRUE}
#define TD6L					{note_thirtysecond, note_D6, TRUE}
#define TDS6L				{note_thirtysecond, note_Ds6, TRUE}
#define TEF6L				{note_thirtysecond, note_Ds6, TRUE}
#define TE6L					{note_thirtysecond, note_E6, TRUE}
#define TF6L					{note_thirtysecond, note_F6, TRUE}
#define TFS6L				{note_thirtysecond, note_Fs6, TRUE}
#define TG6L					{note_thirtysecond, note_G6, TRUE}
#define TGS6L				{note_thirtysecond, note_Gs6, TRUE}
#define TA6L					{note_thirtysecond, note_A6, TRUE}

#define HRES					{note_half, rest, FALSE}
#define QRES					{note_quarter, rest, FALSE}
#define ERES					{note_eighth, rest, FALSE}
#define SRES					{note_sixteenth, rest, FALSE}
#define TRES					{note_thirtysecond, rest, FALSE}

#define ENDING				{end, rest, FALSE} //Indicating the end of the beep pattern
#define REPEAT				{repeat, rest, FALSE}

#endif /* 0_SRC_APPSW_TRICORE_USER_MUSIC_NOTES_H_ */
