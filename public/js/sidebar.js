function toggleSidebar() {
    let sidebar = document.getElementById('sidebar')
    let overlay = document.getElementById('overlay')
    let body = document.body

    sidebar.classList.toggle('hidden')
    sidebar.classList.toggle('flex')

    let isSidebarOpen = sidebar.classList.contains('flex')
    overlay.classList.toggle('hidden', !isSidebarOpen)

    if (isSidebarOpen) {
        body.classList.add('overflow-y-hidden')
    } else {
        body.classList.remove('overflow-y-hidden')
    }
}

function closeSidebar() {
    let sidebar = document.getElementById('sidebar')
    let overlay = document.getElementById('overlay')
    let body = document.body

    sidebar.classList.add('hidden')
    sidebar.classList.remove('flex')

    overlay.classList.add('hidden')
    body.classList.remove('overflow-y-hidden')
}
