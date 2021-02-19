suite["centrality"] = BenchmarkGroup(["degree", "closeness", "betweenness", "katz", "pagerank"])

# betweenness
suite["centrality"]["degree"] = BenchmarkGroup(["graphs", "digraphs"])
suite["centrality"]["degree"]["graphs"] = @benchmarkable [Graphs.degree_centrality(g) for (n,g) in $GRAPHS]
suite["centrality"]["degree"]["digraphs"] = @benchmarkable [Graphs.degree_centrality(g) for (n,g) in $DIGRAPHS]

# closeness
suite["centrality"]["closeness"] = BenchmarkGroup(["graphs", "digraphs"])
suite["centrality"]["closeness"]["graphs"] = @benchmarkable [Graphs.closeness_centrality(g) for (n,g) in $GRAPHS]
suite["centrality"]["closeness"]["digraphs"] = @benchmarkable [Graphs.closeness_centrality(g) for (n,g) in $DIGRAPHS]

# betweenness
suite["centrality"]["betweenness"] = BenchmarkGroup(["graphs", "digraphs"])
suite["centrality"]["betweenness"]["graphs"] = @benchmarkable [Graphs.betweenness_centrality(g) for (n,g) in $GRAPHS if nv(g) < 1000]
suite["centrality"]["betweenness"]["digraphs"] = @benchmarkable [Graphs.betweenness_centrality(g) for (n,g) in $DIGRAPHS if nv(g) < 1000]

# katz
suite["centrality"]["katz"] = BenchmarkGroup(["graphs", "digraphs"])
suite["centrality"]["katz"]["graphs"] = @benchmarkable [Graphs.katz_centrality(g) for (n,g) in $GRAPHS if nv(g) < 1000]
suite["centrality"]["katz"]["digraphs"] = @benchmarkable [Graphs.katz_centrality(g) for (n,g) in $DIGRAPHS if nv(g) < 1000]

#pagerank
suite["centrality"]["katz"] = BenchmarkGroup(["digraphs"])
suite["centrality"]["katz"]["digraphs"] = @benchmarkable [Graphs.pagerank(g) for (n,g) in $DIGRAPHS if nv(g) < 500]
