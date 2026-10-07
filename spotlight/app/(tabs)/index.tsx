import { styles } from "@/styles/auth.styles";
import { Link } from "expo-router";
import { Image, Pressable, Text, TouchableOpacity, View } from "react-native";

export default function Index() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>
        Hello!
      </Text>
      <TouchableOpacity onPress={() => alert('You touched')}>
        <Image style={styles.img} source={require('@/assets/images/icon.png')}/>
        <Text style={styles.touch}>
          Touch me
        </Text>
      </TouchableOpacity>
      <Pressable onPress={() => alert('You pressed')}>
        <Text style={styles.press}>
          Press me
        </Text>
      </Pressable>
      <Link href={'/notifications'}>
        Visit notifications
      </Link>
      <Link href={'/profile'}>
        Visit profile
      </Link>
    </View>
  );
}
