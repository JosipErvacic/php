<body>
    <div class="container form">
        <div class="row">
            <form method="GET" class="mx-auto">
            <?php  echo '<br>', 'Upišite broj redaka' ,'</br>' ?>
                <input type="number" name="line" >
                <?php echo '<br>' , 'Upišite broj stupaca' , '</br>'?>
                <input type="number" name="column">
                <button action="submit">Prikaži tablicu</button>
            </form>
        </div>
    </div>
    <?php
    error_reporting(E_ERROR | E_WARNING | E_PARSE);
    usmjerukazaljkenasatu($_GET['line'], $_GET['column']);
    function usmjerukazaljkenasatu($row, $column)
    {
        $size = ($row * $column);
        $column--;
        $row--;
        $top = 0;
        $right = $column;
        $bottom = $row;
        $left = 0;
        $counter = 1;
        $list = [];
        while ($counter <= $size){
            for ($i = $right; $i >= $left; $i--) {
                $list[$bottom][$i] = $counter++;
            }
            $bottom--;
            if($counter>$size) 
            break;

            for ($i = $bottom; $i >= $top; $i--) {
                $list[$i][$left] = $counter++;
            }
            $left++;
            if($counter>$size) 
            break;

            for ($i = $left; $i <= $right; $i++) {
                $list[$top][$i] = $counter++;
            };
            $top++;
            if($counter > $size) 
            break;

            for ($i = $top; $i <= $bottom; $i++) {
                $list[$i][$right] = $counter++;
            };
            $right--;
            if($counter > $size) 
            break;

        };

        if (isset($_GET['line']) && isset($_GET['column'])) {
            echo '<table>';
            for ($i = 0; $i <= $row; $i++) {
                echo '<tr>';
                for ($j = 0; $j <= $column; $j++) {
                    echo '<td>' . $list[$i][$j] . '</td>';
                };
                echo '</tr>';
            };
            echo '</table>';
            echo '</div>';
        }
    }
    ?>
</body>
</html>