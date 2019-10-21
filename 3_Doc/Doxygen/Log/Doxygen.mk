###############################################################################
#                                                                             #
#        Copyright © 2017 Infineon Technologies AG. All rights reserved.      #
#                                                                             #
#                                                                             #
#                              IMPORTANT NOTICE                               #
#                                                                             #
#                                                                             #
# Infineon Technologies AG (Infineon) is supplying this file for use          #
# exclusively with Infineon’s microcontroller products. This file can be      #
# freely distributed within development tools that are supporting such        #
# microcontroller products.                                                   #
#                                                                             #
# THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED #
# OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF          #
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.#
# INFINEON SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL,#
# OR CONSEQUENTIAL DAMAGES, FOR	ANY REASON WHATSOEVER.                        #
#                                                                             #
###############################################################################

B_DOXYGEN= C:/Tools/BifacesWin32/DocTools/doxygen/bin/doxygen

B_DOXYGEN_LOG_DIR= 3_Doc/Doxygen/Log
B_DOXYGEN_OUT_DIR= 3_Doc/Doxygen/Out

B_DOXYGEN_HTML_PATH= 3_Doc/Doxygen/Out/__RH26_Control_Base_TC275
B_DOXYGEN_RULES_FILE= 3_Doc/Doxygen/Log/DoxygenRules.txt
B_DOXYGEN_HTML_INDEX_FILE= $(B_DOXYGEN_HTML_PATH)/Index.html
B_DOXYGEN_DOC_TARGETS= $(B_DOXYGEN_HTML_INDEX_FILE)
B_DOXYGEN_CLEAN_TARGETS= $(B_DOXYGEN_HTML_PATH)


$(B_DOXYGEN_HTML_INDEX_FILE):
	@echo Doxygen generating documents for __RH26_Control_Base_TC275
	@echo It takes considerable time please wait ..
	@$(B_DOXYGEN) $(B_DOXYGEN_RULES_FILE) 1>$(B_DOXYGEN_LOG_DIR)/Doxygen_log.txt 2>$(B_DOXYGEN_LOG_DIR)/Doxygen_error.txt
	@echo ..done


all: $(B_DOXYGEN_DOC_TARGETS) 
cleanhtml:
	@echo Cleaning generated HTML files ..
	@-rm -rf $(B_DOXYGEN_CLEAN_TARGETS)

clean:
	@echo Cleaning-up Doc folder..
	@-rm -rf 3_Doc/Doxygen

	