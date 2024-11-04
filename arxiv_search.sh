#!/bin/bash

QUERY=$(echo "$@" | tr ' ' '+')

url="https://arxiv.org/search/?query=$QUERY&searchtype=all&source=header"

curl -s -L -A Lynx "$url" | 
tr -d '\n' | 

tr ' ' '\n' | 


grep -oP 'arXiv:[^<&?]+' |

tr -d 'arXiv:' |

sort | uniq
