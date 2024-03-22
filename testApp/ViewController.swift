import UIKit

class ViewController: UIViewController {
    
    var isSun: Bool = true
    var counter: Int = 0
    
    @IBOutlet weak var history: UITextView!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let icon = UIImage(systemName: "clear")
        counterLabel.text = String(counter)
        history.isEditable = false
        refreshButton.setImage(icon, for: .normal)
        
        // Создаем конфигурацию кнопки
        var config = UIButton.Configuration.filled()
        // Настраиваем отступ для иконки
        config.imagePadding = 10  // Добавляем отступ вокруг иконки
        config.title = "Очистить"
        refreshButton.configuration = config
    }
    
    func getDateString() -> String{
        /// Получение текущей даты и времени в формате "dd.MM.yyyy HH:mm"
        
        // Создание экземпляра DateFormatter
        let formatter = DateFormatter()
        
        // Настройка формата даты
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        
        // Получение текущей даты
        let now = Date()
        
        // Преобразование даты в строку
        let dateString = formatter.string(from: now)
        return dateString
        
    }
    
    func scrollDown() {
        /// Скролинг до послдненго символа в поле history

        let range = NSMakeRange(history.text.count - 1, 1)
        history.scrollRangeToVisible(range)
    }
    
    func addLogs(text: String) {
        /// Добавление логов
        
        history.text += "\n[\(getDateString())]: \(text)"
        scrollDown()
    }
    
    
    @IBAction func clear(_ sender: Any) {
        /// Обнуление счетчика

        counter = 0
        counterLabel.text = String(counter)
        addLogs(text: "значение сброшено")
    }
    
    @IBAction func increaseCounter(_ sender: Any) {
        /// Увеличение счетчика на +1
        
        if (counter != 0) {
            counter -= 1
            counterLabel.text = String(counter)
            addLogs(text: "значение изменено на -1")
        } else {
            addLogs(text: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func decreaseCounter(_ sender: Any) {
        /// Уменьшение счетчика на -1

        counter += 1
        counterLabel.text = String(counter)
        addLogs(text: "значение изменено на +1")
    }
    
}

