import re

# Read the file
with open('lib/animations.dart', 'r') as f:
    content = f.read()

# Replace all patterns with type casting
# Pattern 1: width/height: number * value -> cast to double
content = re.sub(
    r'(width|height): (\d+) \* (value|selectedValue|animValue|glowValue),',
    r'\1: (\2 * \3).toDouble(),',
    content
)

# Pattern 2: fontSize: number * value
content = re.sub(
    r'fontSize: (\d+) \* (value|selectedValue|animValue|glowValue),',
    r'fontSize: (\1 * \2).toDouble(),',
    content
)

# Pattern 3: borderRadius.circular(number * value)
content = re.sub(
    r'BorderRadius\.circular\((\d+) \* (value|selectedValue|animValue)\)',
    r'BorderRadius.circular((\1 * \2).toDouble())',
    content
)

# Pattern 4: blurRadius/spreadRadius: number * value
content = re.sub(
    r'(blurRadius|spreadRadius): (\d+) \* (value|selectedValue|glowValue),',
    r'\1: (\2 * \3).toDouble(),',
    content
)

# Pattern 5: offset: Offset(0, number * (1 - value))
content = re.sub(
    r'offset: Offset\(0, (\d+) \* \(1 - (value|selectedValue|animValue)\)\)',
    r'offset: Offset(0, (\1 * (1 - \2)).toDouble())',
    content
)

# Pattern 6: offset: Offset(0, number * value)
content = re.sub(
    r'offset: Offset\(0, (\d+) \* (value|selectedValue|animValue)\)',
    r'offset: Offset(0, (\1 * \2).toDouble())',
    content
)

# Pattern 7: opacity: number - animValue/value
content = re.sub(
    r'opacity: 1 - (animValue|value),',
    r'opacity: (1 - \1).toDouble(),',
    content
)

# Pattern 8: offset: Offset(number * (1 - value), 0)
content = re.sub(
    r'offset: Offset\((\d+) \* \(1 - (value|selectedValue|animValue)\), 0\)',
    r'offset: Offset((\1 * (1 - \2)).toDouble(), 0)',
    content
)

# Pattern 9: offset: Offset((condition ? -1 : 1) * 100 * (1 - value), 0)
content = re.sub(
    r'offset: Offset\(\(isPrevious \? -1 : 1\) \* 100 \* \(1 - (value|selectedValue|animValue)\), 0\)',
    r'offset: Offset(((isPrevious ? -1 : 1) * 100 * (1 - \1)).toDouble(), 0)',
    content
)

# Pattern 10: width: 1 + (1 * selectedValue)
content = re.sub(
    r'width: 1 \+ \(1 \* (selectedValue|value)\),',
    r'width: (1 + (1 * \1)).toDouble(),',
    content
)

# Pattern 11: bottom: -150 * (1 - value)
content = re.sub(
    r'bottom: -(\d+) \* \(1 - (value|selectedValue|animValue)\)',
    r'bottom: (-\1 * (1 - \2)).toDouble()',
    content
)

with open('lib/animations.dart', 'w') as f:
    f.write(content)

print("Type casting fixes applied!")
