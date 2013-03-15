from nltk import load_parser

cp = load_parser('grammars/book_grammars/sql0.fcfg')
query = 'What cities are located in China'
trees = cp.nbest_parse(query.split())
answer = trees[0].node['SEM']
q = ' '.join(answer)
print q
