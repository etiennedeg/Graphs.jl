suite["centrality"] = BenchmarkGroup(["graphs", "digraphs"])
suite["centrality"]["graphs"] = @benchmarkable [Graphs.connected_components(g) for (n,g) in $GRAPHS]
suite["centrality"]["digraphs"] = @benchmarkable [Graphs.strongly_connected_components(g) for (n,g) in $DIGRAPHS]
