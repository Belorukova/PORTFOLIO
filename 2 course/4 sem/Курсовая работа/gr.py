import matplotlib.pyplot as plt
import numpy as np

def tCriteria(x):
    selectX = {
        x == 1: 12.70, x == 2: 4.303, x == 3: 3.182, x == 4: 2.776, x == 5: 2.571, x == 6: 2.447, x == 7: 2.365, x == 8: 2.306,
        x == 9: 2.262, x == 10: 2.228, x == 11: 2.201, x == 12: 2.179, x == 13: 2.160, x == 14: 2.145, x == 15: 2.131, x == 16: 2.120,
        x == 17: 2.110, x == 18: 2.101, x == 19: 2.093, x == 20: 2.086, x == 21: 2.080, x == 22: 2.074, x == 23: 2.069, x == 24: 2.064,
        x == 25: 2.060, x == 26: 2.056, x == 27: 2.052, x == 28: 2.049, x == 29: 2.045, x == 30: 2.042, x == 31: 2.040, x == 32: 2.037,
        x == 33: 2.035, x == 34: 2.032, x == 35: 2.030, x == 36: 2.028, x == 37: 2.026, x == 38: 2.024, x == 39: 2.023, x == 40: 2.021,
        x == 41: 2.020, x == 42: 2.018, x == 43: 2.017, x == 44: 2.015, x == 45: 2.014, x == 46: 2.013, x == 47: 2.012, x == 48: 2.011,
        x == 49: 2.010, x == 50: 2.009, x == 51: 2.008, x == 52: 2.007, x == 53: 2.006, x == 54: 2.005, x == 55: 2.004,x == 56: 2.003,
        x == 57: 2.002, x == 58: 2.002, x == 59: 2.001, x == 60: 2.000, x == 61: 2.000, x == 62: 1.999, x == 63: 1.998, x == 64: 1.998,
        x == 65: 1.997, x == 66: 1.997, x == 67: 1.996, x == 68: 1.995, x == 69: 1.995, x == 70: 1.994, x == 71: 1.994, x == 72: 1.993,
        x == 73: 1.993, x == 74: 1.993, x == 75: 1.992, x == 76: 1.992, x == 77: 1.991, x == 78: 1.991, x == 79: 1.990, x == 80: 1.990,
        81 <= x <= 90: 1.987, 91 <= x <= 100: 1.984, 101 <= x <= 110: 1.982, 111 <= x <= 120: 1.980, 121<= x <= 130: 1.978,
        131 <= x <= 140: 1.977, 141 <= x <= 150: 1.976, 151 <= x <= 200: 1.972, 201 <= x == 250: 1.969,
        251 <= x <= 300: 1.968, 301 <= x <= 350: 1.967
    }
    return selectX[True]

def kReg(r):
    selectR = {
        r == 1: 'функциональная зависимость',
        0.7 <= r <= 0.99: 'сильная статистическая взаимосвязь, близкая к линейной',
        0.5 <= r <= 0.69: 'средняя статистическая взаимосвязь',
        0.2 <= r <= 0.49: 'слабая статистическая взаимосвязь',
        0.09 <= r <= 0.19: 'очень слабая статистическая взаимосвязь',
        r == 0: 'корреляции нет (линейной)'
    }
    return selectR[True]

def printTest(args):
    [A, E, r, r2, t, n] = args
    # средняя ошибка аппроксимации
    if A > 10:
        print('Средняя ошибка аппроксимации равна {:.3f}%, что больше 10%,'.format(A))
        print('а значит модель не является качественной.\n')
    else:
        print('Средняя ошибка аппроксимации равна {:.3f}%, что меньше или равно 10%,'.format(A))
        print('а значит модель является качественной.\n')

    # средний коэффициент эластичности
    print('Коэффициент эластичности показывает, что в среднем по совокупности результативный признак изменится')
    print(' на {:.3f}% при изменении изучаемого фактора на 1% от своего среднего значения.\n'.format(E))

    # коэффициент корреляции
    if r == 0:
        print('Между признаками {text}.\n'.format(text = kReg(abs(r))))
    elif (r > 0):
        print('Коэффициет корреляции равен {:.3f}. Связь между признаками прямая.'.format(r))
        print('Между факторами {text}.\n'.format(text = kReg(abs(r))))
    else:
        print('Коэффициет корреляции равен {:.3f}. Связь между признаками обратная.'.format(r))
        print('Между факторами {text}.\n'.format(text = kReg(abs(r))))

    # коэффициент детерминации
    print('Коэффициет детерминации равен {:.4f}. Он показывает что исследуемый фактор влияет'.format(r2))
    print('на результирующий признак только на {:.2f}%.'.format(r2*100))
    print('Остальные {:.2f}% приходятся на влияние других неучтенных признаков.\n'.format(100 - r2*100))

    # t-критерий Стьюдента
    tKr = tCriteria(n - 2)
    if (t > tKr):
        print('Так как {:.3f} > {:.3f}, то нулевая гипотеза о равенстве нулю коэффициента '.format(t, tKr))
        print('корреляции генеральной совокупности отвергается. Таким образом верна гипотеза H1 и')
        print('изучаемый фактор оказывает статистически существенное влияние на результирующий признак.\n')
    else:
        print('Так как {:.3f} < {:.3f}, то нулевая гипотеза о равенстве нулю коэффициента корреляции '.format(t, tKr))
        print('генеральной совокупности считается верной. Таким образом зучаемый фактор не оказывает ')
        print('статистически существенное влияние на результирующий признак.')
    return 0

def tests(y, newY, b1, avgX, avgY, d1, d2):
    # средняя ошибка аппроксимации
    A = np.mean(list(map(lambda y1, y2: abs(y1-y2)/y1, y, newY)))*100

    # средний коэффициент эластичности
    E = b1*avgX/avgY

    # коэффициент корреляции
    avgY2 = np.mean(list(map(lambda a: a * a, y)))
    r = d1/((np.sqrt(d2))*(np.sqrt(avgY2 - avgY*avgY)))

    # коэффициент детерминации
    r2 = np.sqrt(r)

    # t-критерий Стьюдента
    t = abs(r)/(np.sqrt((1-r*r)/(len(y)-2)))
    printTest([A, E, r, r2, t, len(y)])
    return 0

def equation(x, y):
    avgX = np.mean(x)  # среднее значение x
    avgY = np.mean(y)  # среднее значение y
    avgXY = np.mean(list(map(lambda a, b: a * b, x, y)))  # среднее значение xy
    avgX2 = np.mean(list(map(lambda a: a * a, x)))  # среднее значение x^2
    d1 = (avgXY - avgX*avgY)
    d2 = (avgX2 - avgX*avgX)
    b1 = d1/d2
    b0 = avgY - b1 * avgX
    print('\nУравнение регрессии: y = {:.5f} {:+.5f}x\n'.format(b0, b1))
    newY = list(map(lambda a: b0 + b1*a, x))  # рассчитанные значения y
    tests(y, newY, b1, avgX, avgY, d1, d2)
    return newY

def drawPlot(x, y, textXlbl, textYlbk, xtit, ytit):
    print('Исследуемый фактор x: ', xtit)
    print('Результативный признак y: ', ytit)
    newEq = equation(x, y)
    for i in range(len(x)):
        plt.scatter(x[i], y[i])
    plt.plot(x, newEq)
    plt.grid(True)
    # plt.title(textTitle)
    plt.xlabel(textXlbl)
    plt.ylabel(textYlbk)
    plt.show()

xtit = 'Выбросы наиболее распространенных загрязняющих атмосферу веществ стационарными и передвижными источниками (в тыс. тонн)'
ytit = 'Использование свежей воды по Российской Федерации (в миллиардах кубических метров)'
x = [32301, 33291, 33930, 34652, 35751, 35835, 35510, 35532, 33952, 32754, 32353, 32628, 32469, 32063, 31228, 31269, 31617, 32068]
y = [66.9, 66.8, 64.9, 64.1, 61.5, 61.3, 62.2, 62.5, 62.9, 57.7, 59.5, 59.5, 56.9, 53.6, 56.0, 54.6, 54.7, 53.5]
x2 = [20.3, 19.8, 19.8, 19.0, 18.5, 17.7, 17.5, 17.2, 17.1, 15.9, 16.5, 16.0, 15.7, 15.2, 14.8, 14.4, 14.7, 13.6]
xtit2 = 'Объем сброса загрязненных сточных вод по бассейнам отдельных рек и морей Российской Федерации (в миллиардах кубических метров)'

# drawPlot(x, y, 'Исследуемый праметр x','Результативный признак y', xtit, ytit)
# drawPlot(x2, y, 'Исследуемый праметр x','Результативный признак y', xtit2, ytit)