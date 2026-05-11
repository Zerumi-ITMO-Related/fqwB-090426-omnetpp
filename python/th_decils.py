import numpy as np
import json

# Загрузка данных (файл 'throughput.json' лежит в рабочей директории)
with open('throughput.json', 'r') as f:
    # Используем eval, т.к. файл содержит вызовы np.array
    data = eval(f.read(), {'np': np, '__builtins__': {}})

all_means = []

# Перебор всех запусков (ключей верхнего уровня)
for run_id, run_data in data.items():
    vectors = run_data.get('vectors', [])
    for vec in vectors:
        # Проверяем, что это вектор throughput
        if vec.get('name') == 'throughput:vector':
            values = vec.get('value')
            if values is not None and len(values) > 0:
                mean_val = np.mean(values)
                all_means.append(mean_val)

# Вычисление децилей
deciles = np.percentile(all_means, np.arange(10, 100, 10))

print("Средние значения пропускной способности (bps) по каждому автомобилю:")
for i, m in enumerate(sorted(all_means), 1):
    print(f"  Автомобиль {i:2d}: {m:12.0f} bps = {m/1e6:.3f} Mbps")

print("\nДецили распределения средних пропускных способностей:")
for i, d in enumerate(deciles, 1):
    print(f"  {i*10}%: {d:12.0f} bps  ({d/1e6:.3f} Mbps)")

print(f"\nМинимум: {min(all_means):.0f} bps, Максимум: {max(all_means):.0f} bps")
