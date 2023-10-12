import argparse
import sounddevice as sd


def get_parser():
    parser = argparse.ArgumentParser(
        description="Sample program for realtime i/o.",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter, # default 値をヘルプに追加
        fromfile_prefix_chars="@" # これで始まる引数があった場合、ファイルから引数を読み込み、その位置に置き換え
    )
    parser.add_argument("--sample", type=int, default=7)

    return parser


if __name__=="__main__":
    parser = get_parser()

    print(args := parser.parse_args())
    print(sd.query_devices())
