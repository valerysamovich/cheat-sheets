#!/usr/bin/env bash

# generate start date and enddate base on year (leap/no leap)

YEARS=(2015 2016)
MONTHS=(01 02 03 04 05 06 07 08 09 10 11 12)
DATES=(01 28 29 30 31)

for YEAR in ${YEARS[@]}; do
    # non leap year
    if [ ${YEAR} -eq ${YEARS[0]} ]; then
        for MONTH in ${MONTHS[@]}; do
            if [ ${MONTH} -eq ${MONTHS[0]} ] \
            || [ ${MONTH} -eq ${MONTHS[2]} ] \
            || [ ${MONTH} -eq ${MONTHS[4]} ] \
            || [ ${MONTH} -eq ${MONTHS[6]} ] \
            || [ ${MONTH} -eq ${MONTHS[7]} ] \
            || [ ${MONTH} -eq ${MONTHS[9]} ] \
            || [ ${MONTH} -eq ${MONTHS[11]} ]; then
                echo "${YEAR}-${MONTH}-${DATES[0]} ${YEAR}-${MONTH}-${DATES[4]}"
            elif [ ${MONTH} -eq ${MONTHS[1]} ]; then
                echo "${YEAR}-${MONTH}-${DATES[0]} ${YEAR}-${MONTH}-${DATES[1]}"
            else
                echo "${YEAR}-${MONTH}-${DATES[0]} ${YEAR}-${MONTH}-${DATES[3]}"
            fi
        done
    fi
    # leap year
    if [ ${YEAR} -eq ${YEARS[1]} ]; then
        for MONTH in ${MONTHS[@]}; do
            if [ ${MONTH} -eq ${MONTHS[0]} ] \
            || [ ${MONTH} -eq ${MONTHS[2]} ] \
            || [ ${MONTH} -eq ${MONTHS[4]} ] \
            || [ ${MONTH} -eq ${MONTHS[6]} ] \
            || [ ${MONTH} -eq ${MONTHS[7]} ] \
            || [ ${MONTH} -eq ${MONTHS[9]} ] \
            || [ ${MONTH} -eq ${MONTHS[11]} ]; then
                echo "${YEAR}-${MONTH}-${DATES[0]} ${YEAR}-${MONTH}-${DATES[4]}"
            elif [ ${MONTH} -eq ${MONTHS[1]} ]; then
                echo "${YEAR}-${MONTH}-${DATES[0]} ${YEAR}-${MONTH}-${DATES[2]}"
            else
                echo "${YEAR}-${MONTH}-${DATES[0]} ${YEAR}-${MONTH}-${DATES[3]}"
            fi
        done
    fi
done
