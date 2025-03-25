/*
  Goとの接続テスト用のファイルです。
  好きなタイミングで削除してもらっても構いません。
*/
import { useEffect, useState } from "react";
import { Text, View } from "react-native";
const ConnectGo = () => {
  const [text, setText] = useState<string>("");
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);
  console.log(process.env);
  const url = `${process.env.EXPO_PUBLIC_API_URL}/`;
  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch(url);
        if (!response.ok) {
          throw new Error("ネットワークエラー");
        }
        const data = await response.text();
        setText(data);
      } catch (err) {
        setError("データの取得に失敗しました");
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  if (loading) {
    return <Text>Loading...</Text>;
  }

  if (error) {
    return <Text>{error}</Text>;
  }

  return (
    <View>
      <Text>{text}</Text>
    </View>
  );
};

export default ConnectGo;
