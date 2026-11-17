<script setup lang="ts">
import { computed, ref } from 'vue'

const activeSection = ref('Dashboard')
const selectedPeriod = ref('6M')
const searchQuery = ref('')
const isDark = ref(false)
const showNotifications = ref(false)

const navigation = [
  { label: 'Dashboard', icon: 'home' },
  { label: 'CRM', icon: 'users' },
  { label: 'Sales', icon: 'tag' },
  { label: 'Projects', icon: 'folder' },
  { label: 'Inventory', icon: 'box' },
  { label: 'Finance', icon: 'wallet' },
  { label: 'Reports', icon: 'chart' },
  { label: 'Settings', icon: 'settings' },
]

const activities = [
  {
    icon: 'user',
    kind: 'blue',
    title: 'New lead: Sarah Johnson',
    detail: 'Sarah Johnson',
    time: '2m ago',
  },
  {
    icon: 'check',
    kind: 'green',
    title: 'Opportunity updated:',
    detail: 'Enterprise Deal',
    time: '5m ago',
  },
  {
    icon: 'file',
    kind: 'purple',
    title: 'Invoice INV-1042 paid',
    detail: '',
    time: '12m ago',
  },
  {
    icon: 'box',
    kind: 'blue',
    title: 'New product added:',
    detail: 'Wireless Mouse',
    time: '1h ago',
  },
]

const filteredActivities = computed(() => {
  const query = searchQuery.value.trim().toLowerCase()
  if (!query) return activities
  return activities.filter((activity) =>
    `${activity.title} ${activity.detail}`.toLowerCase().includes(query),
  )
})

const chartSets = {
  '1M': {
    points: '30,104 70,83 110,91 150,55 190,69 230,35',
    labels: ['1', '6', '11', '16', '21', '26'],
  },
  '1Y': {
    points: '30,104 70,91 110,73 150,61 190,45 230,23',
    labels: ['Jul', 'Sep', 'Nov', 'Jan', 'Mar', 'May'],
  },
  '6M': {
    points: '30,104 70,83 110,63 150,83 190,58 230,38',
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
  },
} as const

const activeChart = computed(() => chartSets[selectedPeriod.value as keyof typeof chartSets])
const chartPoints = computed(() => activeChart.value.points)
</script>

<template>
  <div class="dashboard" :class="{ 'theme-dark': isDark }">
    <svg class="icon-library" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
      <symbol id="icon-home" viewBox="0 0 24 24">
        <path d="m3 10 9-7 9 7v10a1 1 0 0 1-1 1h-5v-7H9v7H4a1 1 0 0 1-1-1z" />
      </symbol>
      <symbol id="icon-users" viewBox="0 0 24 24">
        <circle cx="9" cy="8" r="3" /><path d="M3 20v-1a6 6 0 0 1 12 0v1zM16 5.2a3 3 0 0 1 0 5.6m2 3.3a5 5 0 0 1 3 4.6V20h-3" />
      </symbol>
      <symbol id="icon-tag" viewBox="0 0 24 24">
        <path d="M20 13 11 22l-9-9V2h11z" /><circle cx="7" cy="7" r="1" />
      </symbol>
      <symbol id="icon-folder" viewBox="0 0 24 24">
        <path d="M3 6a2 2 0 0 1 2-2h5l2 2h7a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z" />
      </symbol>
      <symbol id="icon-box" viewBox="0 0 24 24">
        <path d="m12 2 9 5v10l-9 5-9-5V7zM3 7l9 5 9-5M12 12v10M8 4.3l9 5" />
      </symbol>
      <symbol id="icon-wallet" viewBox="0 0 24 24">
        <path d="M4 5h15a2 2 0 0 1 2 2v13H4a2 2 0 0 1-2-2V5a3 3 0 0 1 3-3h13v3" /><path d="M21 11h-5a2 2 0 0 0 0 4h5z" /><circle cx="16" cy="13" r=".5" />
      </symbol>
      <symbol id="icon-chart" viewBox="0 0 24 24">
        <path d="M3 3v18h18M7 14l4-4 4 3 6-7" />
      </symbol>
      <symbol id="icon-settings" viewBox="0 0 24 24">
        <circle cx="12" cy="12" r="3" /><path d="m19.4 15 .1.1 1.4 1.1-1.4 2.4-1.7-.7a8 8 0 0 1-1.8 1l-.3 1.8h-2.8l-.3-1.8a8 8 0 0 1-1.8-1l-1.7.7-1.4-2.4L7.1 15a8 8 0 0 1 0-2l-1.4-1.1 1.4-2.4 1.7.7a8 8 0 0 1 1.8-1l.3-1.8h2.8l.3 1.8a8 8 0 0 1 1.8 1l1.7-.7 1.4 2.4-1.4 1.1a8 8 0 0 1-.1 2z" transform="translate(-1 -1)" />
      </symbol>
      <symbol id="icon-search" viewBox="0 0 24 24">
        <circle cx="10.8" cy="10.8" r="6.8" /><path d="m16 16 5 5" />
      </symbol>
      <symbol id="icon-bell" viewBox="0 0 24 24">
        <path d="M18 9a6 6 0 0 0-12 0c0 7-3 7-3 9h18c0-2-3-2-3-9M10 21h4" />
      </symbol>
      <symbol id="icon-revenue" viewBox="0 0 24 24">
        <path d="M4 19V9h4v10M10 19V5h4v14M16 19v-7h4v7M3 21h18" />
      </symbol>
      <symbol id="icon-handshake" viewBox="0 0 24 24">
        <path d="m2 9 4-4 5 1 2 2 2-2 5-1 3 4-4 4-3 1-4-3-4 4-2-2zM6 5l-3 3m15-3 3 3M8 17l2 2 2-2m-5-2-2 2 2 2m10-4 2 2-2 2" />
      </symbol>
      <symbol id="icon-invoice" viewBox="0 0 24 24">
        <path d="M6 2h9l5 5v15H6a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2zM14 2v6h6M8 13h8m-8 4h8" />
      </symbol>
      <symbol id="icon-alert" viewBox="0 0 24 24">
        <path d="M12 3 2 21h20L12 3z" /><path d="M12 9v5m0 3h.01" />
      </symbol>
      <symbol id="icon-user" viewBox="0 0 24 24">
        <circle cx="12" cy="8" r="3" /><path d="M5 21v-2a7 7 0 0 1 14 0v2z" />
      </symbol>
      <symbol id="icon-check" viewBox="0 0 24 24">
        <path d="m5 12 4 4L19 6" />
      </symbol>
      <symbol id="icon-file" viewBox="0 0 24 24">
        <path d="M6 3h12v18H6zM9 8h6m-6 4h6m-6 4h4" />
      </symbol>
      <symbol id="icon-moon" viewBox="0 0 24 24">
        <path d="M20.5 15.5A8.5 8.5 0 0 1 8.5 3.5a8.6 8.6 0 1 0 12 12z" />
      </symbol>
      <symbol id="icon-arrow" viewBox="0 0 24 24">
        <path d="M5 12h14m-6-6 6 6-6 6" />
      </symbol>
      <symbol id="icon-chevron" viewBox="0 0 24 24">
        <path d="m7 10 5 5 5-5" />
      </symbol>
    </svg>

    <aside class="sidebar">
      <a class="brand" href="/" aria-label="Kestrel home" @click.prevent="activeSection = 'Dashboard'">
        <span class="brand-mark">✦</span>
        <span>Kestrel</span>
      </a>

      <nav class="side-nav" aria-label="Main navigation">
        <button
          v-for="item in navigation"
          :key="item.label"
          class="nav-item"
          :class="{ active: activeSection === item.label }"
          type="button"
          @click="activeSection = item.label"
        >
          <svg class="nav-icon"><use :href="`#icon-${item.icon}`" /></svg>
          <span>{{ item.label }}</span>
        </button>
      </nav>

      <div class="sidebar-bottom">
        <button class="theme-switch" type="button" :aria-pressed="isDark" @click="isDark = !isDark">
          <svg class="nav-icon"><use href="#icon-moon" /></svg>
          <span>Dark Mode</span>
          <span class="switch" :class="{ on: isDark }"><span /></span>
        </button>
        <span class="version">v1.0</span>
      </div>
    </aside>

    <main class="main-content">
      <header class="topbar">
        <label class="search-box">
          <svg class="search-icon"><use href="#icon-search" /></svg>
          <input v-model="searchQuery" type="search" placeholder="Search anything..." aria-label="Search activities" />
        </label>
        <div class="topbar-actions">
          <label class="team-select">
            <select aria-label="Select team">
              <option>Acme Corp</option>
              <option>Design Team</option>
              <option>Sales Team</option>
            </select>
            <svg class="select-chevron"><use href="#icon-chevron" /></svg>
          </label>
          <div class="notification-wrap">
            <button
              class="icon-button notification-button"
              type="button"
              aria-label="Notifications"
              :aria-expanded="showNotifications"
              @click="showNotifications = !showNotifications"
            >
              <svg><use href="#icon-bell" /></svg>
              <span class="notification-dot" />
            </button>
            <div v-if="showNotifications" class="notification-popover" role="status">
              <strong>You're all caught up</strong>
              <span>No new notifications</span>
            </div>
          </div>
          <button class="avatar" type="button" aria-label="Open profile">JD</button>
        </div>
      </header>

      <div class="page-content">
        <div class="page-title">
          <svg><use href="#icon-home" /></svg>
          <h1>{{ activeSection }}</h1>
        </div>

        <section class="metrics" aria-label="Business overview">
          <article class="metric-card">
            <span class="metric-icon revenue-icon"><svg><use href="#icon-revenue" /></svg></span>
            <strong>$245,780</strong>
            <span class="metric-label">Total Revenue</span>
            <span class="metric-change positive"><span>↑</span> 12%</span>
          </article>
          <article class="metric-card">
            <span class="metric-icon opportunity-icon"><svg><use href="#icon-handshake" /></svg></span>
            <strong>24</strong>
            <span class="metric-label">Open Opportunities</span>
            <span class="metric-change positive"><span>↑</span> 8%</span>
          </article>
          <article class="metric-card">
            <span class="metric-icon invoice-icon"><svg><use href="#icon-invoice" /></svg></span>
            <strong>$32,400</strong>
            <span class="metric-label">Overdue Invoices</span>
            <span class="metric-change negative"><span>↓</span> 5%</span>
          </article>
          <article class="metric-card">
            <span class="metric-icon inventory-icon"><svg><use href="#icon-box" /></svg></span>
            <strong>7</strong>
            <span class="metric-label">Inventory Alerts</span>
            <span class="metric-change negative"><span>↓</span> 1%</span>
          </article>
        </section>

        <section class="dashboard-panels">
          <article class="panel revenue-panel">
            <div class="panel-heading">
              <h2>Revenue Overview</h2>
              <div class="period-tabs" aria-label="Revenue chart period">
                <button
                  v-for="period in ['6M', '1Y', '1M']"
                  :key="period"
                  type="button"
                  :class="{ selected: selectedPeriod === period }"
                  :aria-pressed="selectedPeriod === period"
                  @click="selectedPeriod = period"
                >
                  {{ period }}
                </button>
              </div>
            </div>
            <div class="chart">
              <div class="chart-y-labels" aria-hidden="true">
                <span>150k</span><span>100k</span><span>50k</span><span>0k</span>
              </div>
              <svg class="revenue-chart" viewBox="0 0 250 140" role="img" aria-label="Revenue trend chart">
                <defs>
                  <linearGradient id="chart-fill" x1="0" x2="0" y1="0" y2="1">
                    <stop offset="0%" stop-color="#27b5b8" stop-opacity=".16" />
                    <stop offset="100%" stop-color="#27b5b8" stop-opacity="0" />
                  </linearGradient>
                </defs>
                <path class="chart-fill" :d="`M ${chartPoints.replaceAll(' ', ' L ')} L 230 128 L 30 128 Z`" />
                <path class="chart-grid" d="M30 18H235M30 50H235M30 82H235M30 114H235M30 128H235" />
                <path class="chart-line" :d="`M ${chartPoints.replaceAll(' ', ' L ')}`" />
                <circle v-for="(point, index) in chartPoints.split(' ')" :key="index" :cx="point.split(',')[0]" :cy="point.split(',')[1]" r="3.5" class="chart-point" />
                <text v-for="(label, index) in activeChart.labels" :key="label" :x="30 + index * 40" y="139">{{ label }}</text>
              </svg>
            </div>
          </article>

          <article class="panel activity-panel">
            <div class="panel-heading">
              <h2>Recent Activity</h2>
              <button class="view-all" type="button" @click="searchQuery = ''">View All <span>→</span></button>
            </div>
            <ul v-if="filteredActivities.length" class="activity-list">
              <li v-for="activity in filteredActivities" :key="activity.title" class="activity-item">
                <span class="activity-icon" :class="activity.kind">
                  <svg><use :href="`#icon-${activity.icon}`" /></svg>
                </span>
                <p><strong>{{ activity.title }}</strong><span v-if="activity.detail">{{ activity.detail }}</span></p>
                <time>{{ activity.time }}</time>
              </li>
            </ul>
            <p v-else class="empty-activity">No matching activity</p>
          </article>
        </section>
      </div>
    </main>
  </div>
</template>
