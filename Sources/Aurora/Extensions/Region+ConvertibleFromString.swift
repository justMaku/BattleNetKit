import BattleNetKit
import SwiftCLI

extension Region: ConvertibleFromString {
    public init?(input: String) {
        do {
            try self.init(from: input)
        } catch {
            return nil
        }
    }
}
