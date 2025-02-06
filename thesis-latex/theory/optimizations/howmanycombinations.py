def manhatan_distance(xa, ya, xb=2, yb=2):
    return abs(xa - xb) + abs(ya - yb)


main_buffer = set([])

for x1 in range(5):
    for y1 in range(5):
        for x2 in range(5):
            for y2 in range(5):
                for x3 in range(5):
                    for y3 in range(5):
                        if (
                            manhatan_distance(x1, y1) <= 2
                            and manhatan_distance(x2, y2) <= 2
                            and manhatan_distance(x3, y3) <= 2
                        ):
                            if (
                                manhatan_distance(x1, y1, x2, y2) == 1
                                and manhatan_distance(x2, y2, x3, y3) == 1
                            ):
                                if (x1, y1) != (x3, y3):
                                    possible_edge = [
                                        (x1, y1),
                                        (x2, y2),
                                        (x3, y3),
                                    ]
                                    possible_edge.sort()

                                    main_buffer.add(tuple(possible_edge))

print(main_buffer)
print(len(main_buffer))
