import pandas as pd


def missing_val_count(df, idx):
    time_val_counts = list(pd.date_range(min_time[idx], max_time[idx], freq="15T"))
    return len(set(time_val_counts) - set(df[df.name==idx]["time"]))


if __name__ == "__main__":
    df = pd.read_csv(r"C:\Users\vikas\Downloads\test.csv")

    df["time"] = pd.to_datetime(df["time"], format = "%H:%M:%S")


    min_time = df.groupby("name").apply(lambda x: min(x.time))
    max_time = df.groupby("name").apply(lambda x: max(x.time))


    for i in ["A", "B", "C", "D"]:
        print(i, missing_val_count(df, i))