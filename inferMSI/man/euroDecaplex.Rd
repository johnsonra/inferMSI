\name{decaplex}

\alias{euroDecaplex}

\docType{data}

\title{Model for decaplex MSI panel}

\description{Model output from trainMSI() for the decaplex MSI panel}

\usage{data("decaplex")}

\format{
  The format is:
List of 5
 $ pred   : Named num [1:10] -29 12.1 31.8 12.1 16 ...
  ..- attr(*, "names")= chr [1:10] "D2S123" "D5S346" "Bat_25" "Bat_26" ...
 $ markers: Named chr [1:10] "D2S123" "D5S346" "D17S250" "Bat_25" ...
  ..- attr(*, "names")= chr [1:10] "2:51288512-51288554 2_21.5_2_51288512_51288554_86_51_48_0_0_1.0_AC" "5:112213679-112213718 2_20.5_2_112213679_112213718_82_0_0_48_51_1.0_TG" "17:37152124-37152163 2_20_2_37152124_37152163_80_0_0_50_50_1.0_TG" "4:55598198-55598236 1_39.0_1_55598198_55598236_51_2_0_5_92_0.46_T" ...
 $ normal :List of 9
  ..$ D2S123 : Named num [1:31] 1.01e-01 2.69e-02 3.99e-04 2.41e-07 5.11e-12 ...
  .. ..- attr(*, "names")= chr [1:31] "23" "24" "25" "26" ...
  ..$ D5S346 : Named num [1:37] 8.06e-05 2.61e-04 7.13e-04 1.64e-03 3.20e-03 ...
  .. ..- attr(*, "names")= chr [1:37] "14" "15" "16" "17" ...
  ..$ Bat_25 : Named num [1:18] 1.67e-06 2.85e-04 5.29e-03 1.23e-02 3.88e-03 ...
  .. ..- attr(*, "names")= chr [1:18] "26" "27" "28" "29" ...
  ..$ Bat_26 : Named num [1:21] 0.00133 0.0043 0.01051 0.0194 0.02708 ...
  .. ..- attr(*, "names")= chr [1:21] "9" "10" "11" "12" ...
  ..$ Bat_40 : Named num [1:36] 1.76e-06 3.80e-06 7.95e-06 1.60e-05 3.13e-05 ...
  .. ..- attr(*, "names")= chr [1:36] "18" "19" "20" "21" ...
  ..$ MYCL   : Named num [1:55] 0.00196 0.00268 0.00359 0.0047 0.00604 ...
  .. ..- attr(*, "names")= chr [1:55] "84" "85" "86" "87" ...
  ..$ D18S55 : Named num [1:54] 0.000161 0.000187 0.000226 0.000296 0.000433 ...
  .. ..- attr(*, "names")= chr [1:54] "22" "23" "24" "25" ...
  ..$ D18S67 : Named num [1:54] 0.000443 0.000544 0.000661 0.000797 0.00095 ...
  .. ..- attr(*, "names")= chr [1:54] "24" "25" "26" "27" ...
  ..$ D18S487: Named num [1:33] 1.32e-55 2.49e-44 1.96e-34 6.41e-26 8.85e-19 ...
  .. ..- attr(*, "names")= chr [1:33] "14" "15" "16" "17" ...
}

\source{
  # coming soon?
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}

\references{
  # coming soon
%%  ~~ possibly secondary sources and usages ~~
}

\examples{
data(euroDecaplex)
}

\keyword{datasets}
