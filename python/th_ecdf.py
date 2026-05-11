import numpy as np
import matplotlib.pyplot as plt
import scienceplots

def load_and_process_data(filename):
    """
    Загружает данные из JSON файла и вычисляет среднюю пропускную способность
    для каждого вектора. Возвращает значения в бит/с.
    """
    with open(filename, 'r') as f:
        content = f.read()
    results = eval(content)
    mean_throughputs = []
    for run_id, run_data in results.items():
        if 'vectors' in run_data:
            for vector in run_data['vectors']:
                if vector['name'] == 'throughput:vector':
                    values = vector['value']
                    mean_val = np.mean(values)
                    mean_throughputs.append(mean_val)
    return np.array(mean_throughputs)

def plot_ecdf(data, title="ECDF of Average Throughput", xlabel="Average Throughput (Mbps)",
              ylabel="ECDF", save_path=None, show=True):
    """
    Строит график ECDF для переданных данных.
    Ожидает данные уже в Мбит/с.
    """
    sorted_data = np.sort(data)
    y = np.arange(1, len(sorted_data) + 1) / len(sorted_data)

    #plt.style.use('ggplot')
    plt.style.use(['science', 'notebook'])

    plt.figure(figsize=(10, 6))
    plt.step(sorted_data, y, where='post', linewidth=2)

    plt.title(title, fontsize=14)
    plt.xlabel(xlabel, fontsize=12)
    plt.ylabel(ylabel, fontsize=12)
    plt.grid(True, alpha=0.3)

    # Статистика в Мбит/с
    median = np.median(data)
    q25 = np.percentile(data, 25)
    q75 = np.percentile(data, 75)

    stats_text = f'n = {len(data)}\n'
    stats_text += f'Mean = {np.mean(data):.2f}\n'
    stats_text += f'Std = {np.std(data):.2f}\n'
    stats_text += f'Min = {np.min(data):.2f}\n'
    stats_text += f'Q25 = {q25:.2f}\n'
    stats_text += f'Q50 = {median:.2f}\n'
    stats_text += f'Q75 = {q75:.2f}\n'
    stats_text += f'Max = {np.max(data):.2f}'

    plt.text(0.02, 0.98, stats_text, transform=plt.gca().transAxes,
             verticalalignment='top', fontsize=10,
             bbox=dict(boxstyle='round', facecolor='wheat', alpha=0.5))

    plt.tight_layout()
    if save_path:
        plt.savefig(save_path, dpi=300, bbox_inches='tight')
    if show:
        plt.show()

def main():
    filename = 'throughput5km.json'   # укажите путь к вашему файлу

    print("Загрузка и обработка данных...")
    try:
        throughput_bps = load_and_process_data(filename)
        # Перевод в Мбит/с
        throughput_mbps = throughput_bps / 1e6

        print(f"Загружено {len(throughput_mbps)} векторов пропускной способности")
        print("\nСтатистика средней пропускной способности (Мбит/с):")
        print(f"  Среднее:  {np.mean(throughput_mbps):.2f}")
        print(f"  Медиана:  {np.median(throughput_mbps):.2f}")
        print(f"  Стандартное отклонение: {np.std(throughput_mbps):.2f}")
        print(f"  Минимум:  {np.min(throughput_mbps):.2f}")
        print(f"  Максимум: {np.max(throughput_mbps):.2f}")

        # ECDF в Мбит/с
        plot_ecdf(throughput_mbps,
                  title="ECDF of Average Throughput per Vehicle",
                  xlabel="Average Throughput (Mbps)",
                  save_path="throughput_ecdf_5km.png")

        # Дополнительно гистограмма в Мбит/с
        plt.figure(figsize=(10, 6))
        plt.hist(throughput_mbps, bins=50, edgecolor='black', alpha=0.7)
        plt.title("Distribution of Average Throughput", fontsize=14)
        plt.xlabel("Average Throughput (Mbps)", fontsize=12)
        plt.ylabel("Frequency", fontsize=12)
        plt.grid(True, alpha=0.3)
        plt.tight_layout()
        plt.savefig("throughput_histogram_5km.png", dpi=300, bbox_inches='tight')
        plt.show()

    except FileNotFoundError:
        print(f"Ошибка: Файл '{filename}' не найден.")
    except Exception as e:
        print(f"Произошла ошибка: {e}")

if __name__ == "__main__":
    main()
    
