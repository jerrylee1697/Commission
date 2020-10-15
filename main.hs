import Network.HTTP.Client
import Network.HTTP.Client.TLS
import AlphaVantage

main :: IO ()
main = do
    mgr <- newManager tlsManagerSettings
    config <- withStdoutLogging =<< (newConfig $ Apikey "Demo")
    let tsRequest = getStockTimeSeries
                    StockTimeSeriesMonthly
                    (Symbol "MSFT")
                    -&- Outputsize'Compact
    response <- dispatchRequest mgr config tsRequest
    putStrLn $ show response
    return ()