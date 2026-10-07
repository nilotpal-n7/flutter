import { View, Text } from 'react-native'
import React from 'react'
import { Tabs } from 'expo-router'

export default function TabLayout() {
  return (
    <Tabs>
      <Tabs.Screen name='index'/>
      <Tabs.Screen name='bookmarks'/>
      <Tabs.Screen name='create'/>
      <Tabs.Screen name='notifications'/>
      <Tabs.Screen name='profile'/>
    </Tabs>
  )
}
