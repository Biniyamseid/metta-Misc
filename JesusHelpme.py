class Handle:
    def __init__(self, node):
        self.node = node
        self.values = {}

    def get_value(self, key):
        return self.values.get(key, None)

    def set_value(self, key, value):
        self.values[key] = value


class TruthValue:
    def __init__(self, mean, confidence):
        self.mean = mean
        self.confidence = confidence


class Surprisingness:
    @staticmethod
    def emp_tv_key():
        return "*-EmpiricalTruthValueKey-*"

    @staticmethod
    def get_emp_tv(pattern):
        val = pattern.get_value(Surprisingness.emp_tv_key())
        if val:
            return val
        return None

    @staticmethod
    def set_emp_tv(pattern, etv):
        pattern.set_value(Surprisingness.emp_tv_key(), etv)

    @staticmethod
    def emp_tv(pattern, db):
        ucount = Surprisingness.universe_count(pattern, db)
        ms = min(float('inf'), ucount)
        sup = MinerUtils.support(pattern, db, ms)
        mean = sup / ucount
        conf = Surprisingness.count_to_confidence(ucount)
        conf *= 1e-1  # Lower the confidence due to potential errors
        return TruthValue(mean, conf)

    @staticmethod
    def universe_count(pattern, db):
        # Placeholder for the actual implementation
        return 100.0

    @staticmethod
    def count_to_confidence(count):
        # Placeholder for the actual implementation
        return 1.0


class MinerUtils:
    @staticmethod
    def support(pattern, db, ms):
        # Placeholder for the actual implementation
        return 50.0


# Example usage
pattern = Handle("example_node")
db = ["data1", "data2", "data3"]

# Set empirical truth value
etv = Surprisingness.emp_tv(pattern, db)
Surprisingness.set_emp_tv(pattern, etv)

# Get empirical truth value
retrieved_etv = Surprisingness.get_emp_tv(pattern)
print(f"Mean: {retrieved_etv.mean}, Confidence: {retrieved_etv.confidence}")