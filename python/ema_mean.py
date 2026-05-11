import numpy as np
import pandas as pd

# Загрузка данных (согласно комментарию в начале файла)
with open('5km/thr130.json', 'r') as f:
    data = eval(f.read())

# Извлечение массива значений пропускной способности
values = data['General-0-20260508-19:19:18-1855295']['vectors'][0]['value']

# Расчёт EMA с alpha = 0.1
series = pd.Series(values)
ema = series.ewm(alpha=0.1, adjust=False).mean()

# Среднее значение EMA-вектора
mean_ema = np.mean(ema)

print(f"Среднее значение EMA (alpha=0.1): {mean_ema / 1000 / 1000}")
