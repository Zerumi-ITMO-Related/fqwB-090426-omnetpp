import numpy as np
import pandas as pd

# 1. Загрузка данных из файла (согласно комментарию в начале файла)
filename = "throghput110.json"
with open(filename, 'r') as f:
    data = eval(f.read())

# 2. Извлечение массива значений пропускной способности
# Путь к данным: сначала ключ run, затем 'vectors', первый элемент, 'value'
run_key = list(data.keys())[0]          # "General-0-20260508-19:03:22-1847698"
values = data[run_key]['vectors'][0]['value'] / 1000 / 1000

# 3. Расчёт EMA с alpha = 0.1
alpha = 0.1
series = pd.Series(values)
ema = series.ewm(alpha=alpha, adjust=False).mean()   # adjust=False – классическая рекуррентная формула

# 4. Децили (10%, 20%, ..., 90%) для сглаженного ряда
deciles = np.percentile(ema, np.arange(10, 100, 10))

# 5. Вывод результатов
print("Децили EMA (alpha=0.1):")
for i, d in enumerate(deciles, start=1):
    print(f"  {i*10}%: {d:.2f}")

# Дополнительно: среднее значение EMA (для справки)
print(f"\nСреднее значение EMA: {ema.mean():.2f}")
