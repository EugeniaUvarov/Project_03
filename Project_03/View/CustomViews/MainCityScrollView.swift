


import UIKit


class MainCityScrollView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {

    var scrollView: UIScrollView!
    var stackView: UIStackView!
    var collectionView: UICollectionView!
    var tableView: UITableView!

    var forecastModel: ForecastModel = ForecastModel(
        currentweather: [CurrentWeatherModel(temperature: 20.0, city: "City", time: "2 PM", condition: "Sunny", lowtemperature: 15.0, hightemperature: 25.0, feelsLike: 19.0, humidity: 60, precipitation: 0.0, visibility: 10.0, wind: 10, pressure: 1010)],
        dailyweather: [DailyWeatherModel(lowtemp: 15.0, hightemp: 25.0, day: "Monday", icon: "sun.max.fill")],
        hourlyweather: [HourlyWeatherModel(hour: "2 PM", temperature: 20.0, condition: "Sunny", icon: "sun.max.fill")],
        location: [LocationModel(city: "City", country: "Country", latitude: 12.34, longitude: 56.78)]
    )

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        // Initialize scrollView
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .red // For debugging visibility
        addSubview(scrollView)

        // Initialize stackView
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .cyan // For debugging visibility
        scrollView.addSubview(stackView)

        // UICollectionView Setup
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 70, height: 120)
        layout.minimumInteritemSpacing = 10
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HourlyWeatherCell.self, forCellWithReuseIdentifier: "HourlyWeatherCell")
        collectionView.backgroundColor = .blue // For debugging visibility
        stackView.addArrangedSubview(collectionView)

        // TableView Setup
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DailyWeatherCell.self, forCellReuseIdentifier: "DailyWeatherCell")
        tableView.backgroundColor = .systemBlue // For debugging visibility
        stackView.addArrangedSubview(tableView)

        // Apply Constraints
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),

            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor), // Ensuring scroll view height adjusts based on content
            
            collectionView.heightAnchor.constraint(equalToConstant: 120),
            tableView.heightAnchor.constraint(equalToConstant: 300)
        ])

        // Reload the collection view and table view to ensure they're populated
        collectionView.reloadData()
        tableView.reloadData()
    }

    // MARK: - UICollectionView DataSource & Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecastModel.hourlyweather.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourlyWeatherCell", for: indexPath) as? HourlyWeatherCell else {
            return UICollectionViewCell()
        }

        let data = forecastModel.hourlyweather[indexPath.row]
        cell.configure(hour: data.hour, temperature: String(data.temperature), icon: UIImage(systemName: data.icon) ?? UIImage())
        return cell
    }

    // MARK: - UITableView DataSource & Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastModel.dailyweather.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DailyWeatherCell", for: indexPath) as? DailyWeatherCell else {
            return UITableViewCell()
        }

        let data = forecastModel.dailyweather[indexPath.row]
        cell.configure(day: data.day, lowTemp: String(data.lowtemp), highTemp: String(data.hightemp), icon: UIImage(systemName: data.icon) ?? UIImage())
        
        return cell
    }
}
