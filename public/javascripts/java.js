Function checkNumber(textBox)
{
  while (textBox.value.lenght > 0 && isNaN(textBox.value)) {
    textBox.value = textBox.value.substring(0, textBox.value.length - 1)
  }
  textBox.value = trim(textBox.value);
}
