# get dictionary coverage

coverage = rep(0,length(blogfreq))
nwords=sum(blogfreq)
blogfreqdesc=blogfreq[order(blogfreq,decreasing = TRUE)]

for (i in count){
  coverage[i] = sum(blogfreqdesc[1:i])/nwords
}