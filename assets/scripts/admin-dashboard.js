// Initialize Map
const map = L.map("map").setView([14.5995, 120.9842], 13);

L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
  attribution: "© OpenStreetMap contributors",
}).addTo(map);

// Add markers for establishments
const establishments = [
  {
    lat: 14.6042,
    lng: 120.9822,
    name: "Vivic Town Center",
    status: "compliant",
    type: "shopping",
  },
  {
    lat: 14.5965,
    lng: 120.9785,
    name: "Calamitasan State University",
    status: "compliant",
    type: "education",
  },
  {
    lat: 14.5892,
    lng: 120.9754,
    name: "Vivic Public Market",
    status: "non-compliant",
    type: "market",
  },
  {
    lat: 14.5955,
    lng: 120.9925,
    name: "SM Mall of Asia",
    status: "compliant",
    type: "shopping",
  },
  {
    lat: 14.6015,
    lng: 120.9745,
    name: "Robinson's Place Manila",
    status: "pending",
    type: "shopping",
  },
  {
    lat: 14.5875,
    lng: 120.9812,
    name: "Manila Hotel",
    status: "compliant",
    type: "hotel",
  },
];

establishments.forEach((est) => {
  let iconColor =
    est.status === "compliant"
      ? "green"
      : est.status === "non-compliant"
      ? "red"
      : "orange";

  let marker = L.marker([est.lat, est.lng], {
    icon: L.divIcon({
      html: `<div style="background: ${iconColor}; width: 15px; height: 15px; border-radius: 50%; border: 2px solid white; box-shadow: 0 2px 4px rgba(0,0,0,0.3);"></div>`,
      iconSize: [15, 15],
      className: "custom-marker",
    }),
  }).addTo(map);

  marker.bindPopup(`
                <strong>${est.name}</strong><br>
                Status: <span style="color: ${iconColor}; font-weight: bold;">${est.status.toUpperCase()}</span><br>
                Type: ${est.type}<br>
                <button class="btn btn-sm btn-outline-primary mt-2" onclick="viewDetails('${
                  est.name
                }')">View Details</button>
            `);
});

// Initialize Compliance Trend Chart
const ctx = document.getElementById("complianceChart").getContext("2d");
const complianceChart = new Chart(ctx, {
  type: "line",
  data: {
    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun"],
    datasets: [
      {
        label: "Compliant Establishments",
        data: [85, 90, 88, 95, 102, 110],
        borderColor: "#28a745",
        backgroundColor: "rgba(40, 167, 69, 0.1)",
        fill: true,
        tension: 0.4,
      },
      {
        label: "Non-Compliant",
        data: [25, 20, 18, 15, 16, 14],
        borderColor: "#dc3545",
        backgroundColor: "rgba(220, 53, 69, 0.1)",
        fill: true,
        tension: 0.4,
      },
    ],
  },
  options: {
    responsive: true,
    maintainAspectRatio: true,
    aspectRatio: 2,
    plugins: {
      legend: {
        position: "bottom",
      },
    },
    scales: {
      y: {
        beginAtZero: true,
        max: 120,
      },
    },
  },
});

// Animate stats cards on load
document.addEventListener("DOMContentLoaded", function () {
  const statsCards = document.querySelectorAll(".stats-card");
  statsCards.forEach((card, index) => {
    setTimeout(() => {
      card.style.opacity = "0";
      card.style.transform = "translateY(20px)";
      card.style.transition = "all 0.5s ease";

      setTimeout(() => {
        card.style.opacity = "1";
        card.style.transform = "translateY(0)";
      }, 50);
    }, index * 100);
  });
});

// Update stats in real-time (demo)
setInterval(() => {
  const pendingElement = document.querySelector(".stats-card.pending h3");
  const currentValue = parseInt(pendingElement.textContent);

  // Simulate random updates
  if (Math.random() > 0.7) {
    const change = Math.random() > 0.5 ? 1 : -1;
    const newValue = Math.max(0, currentValue + change);
    pendingElement.textContent = newValue;
  }
}, 10000);
