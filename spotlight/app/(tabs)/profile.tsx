import { View, Text } from 'react-native'
import React from 'react'
import { styles } from '@/styles/auth.styles'

export default function Profile() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>
          Profile
      </Text>
    </View>
  )
}
