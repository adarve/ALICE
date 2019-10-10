FROM r-base

RUN echo 'install.packages("BiocManager")' | R --save
RUN echo 'BiocManager::install(ask=FALSE)' | R --save
RUN echo 'BiocManager::install("Biostrings")' | R --save
RUN echo 'install.packages("igraph")' | R --save
RUN echo 'install.packages("data.table")' | R --save
RUN echo 'install.packages("stringdist")' | R --save

RUN mkdir /src
WORKDIR /src
COPY * ./
#RUN mkdir /sample
#COPY sample/* /sample/

CMD Rscript --save quickstart.r /sample/S1_d15_V9_J2_7.tsv /sample/S1_d0_V9_J2_7.tsv
