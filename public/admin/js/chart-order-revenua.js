document.addEventListener('DOMContentLoaded', function () {
    fetch('/daily-revenue')
        .then(response => response.json())
        .then(data => {
            const categories = data.map(item => item.date);
            const revenues = data.map(item => item.revenue);

            var columnChartOptions = {
                series: [
                    {
                        name: "Total Revenue",
                        data: revenues,
                    }
                ],
                chart: {
                    type: "bar",
                    height: 350,
                    stacked: !1,
                    columnWidth: "70%",
                    zoom: { enabled: !0 },
                    toolbar: { show: !1 },
                    background: "transparent",
                },
                dataLabels: { enabled: !1 },
                xaxis: {
                    type: "datetime",
                    categories: categories,
                    labels: {
                        show: !0,
                        trim: !0,
                        maxHeight: 120,
                        style: {
                            colors: "#6C757D",
                            fontFamily: "Arial",
                        },
                    },
                    axisBorder: { show: !1 },
                },
                yaxis: {
                    labels: {
                        show: !0,
                        trim: !1,
                        offsetX: -10,
                        maxHeight: 120,
                        style: {
                            colors: "#6C757D",
                            fontFamily: "Arial",
                        },
                    },
                },
                legend: {
                    position: "top",
                    fontFamily: "Arial",
                    fontWeight: 400,
                    labels: { colors: "#6C757D", useSeriesColors: !1 },
                    markers: {
                        width: 10,
                        height: 10,
                        strokeWidth: 0,
                        strokeColor: "#fff",
                        fillColors: ["#007bff"],
                        radius: 6,
                    },
                    itemMargin: { horizontal: 10, vertical: 0 },
                    onItemClick: { toggleDataSeries: !0 },
                    onItemHover: { highlightDataSeries: !0 },
                },
                fill: {
                    opacity: 1,
                    colors: ["#007bff"],
                },
                grid: {
                    show: !0,
                    borderColor: "#e0e0e0",
                    strokeDashArray: 0,
                    position: "back",
                    xaxis: { lines: { show: !1 } },
                    yaxis: { lines: { show: !0 } },
                    row: { colors: void 0, opacity: 0.5 },
                    column: { colors: void 0, opacity: 0.5 },
                    padding: { top: 0, right: 0, bottom: 0, left: 0 },
                },
            };

            var columnChartCtn = document.querySelector("#columnChart");
            if (columnChartCtn) {
                var columnChart = new ApexCharts(columnChartCtn, columnChartOptions);
                columnChart.render();
            }
        });
});
