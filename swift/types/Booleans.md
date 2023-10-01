public extension Bool {
    init?(optString value: String?) {
        guard let value = value else {
            return nil
        }

        switch value.lowercased() {
        case "true":
            self = true
        case "false":
            self = false
        default:
            return nil
        }
    }
    init(string: String) {
        if string.lowercased() == "true" {
            self = true
        } else {
            self = false
        }
    }
    init(string: String?) {
        self.init(string: string ?? "")
    }
}
