# EMA Crossover Strategy (example) - purely illustrative
import pandas as pd

def generate_signals(df, short=12, long=26):
    df = df.copy()
    df['ema_short'] = df['close'].ewm(span=short).mean()
    df['ema_long'] = df['close'].ewm(span=long).mean()
    df['signal'] = 0
    df.loc[df['ema_short'] > df['ema_long'], 'signal'] = 1
    df.loc[df['ema_short'] < df['ema_long'], 'signal'] = -1
    return df
