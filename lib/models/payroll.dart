class Payroll{
  double _hoursWorked ;
  double _hourlyRate ;
  double _taxPercent;
  double _deductions;
  Payroll(this._hoursWorked , this._hourlyRate , this._taxPercent , this._deductions);
  double get hoursWorked => _hoursWorked ;
  double get hourlyRate => _hourlyRate ;
  double get taxPercent => _taxPercent ;
  double get deductions => _deductions;
  double get gross{
    return hoursWorked * hourlyRate ;//bytla3lna edeh m3achu 
  }
  double get taxAmount{
    return gross * (taxPercent/100);//edeh ha tkun 2imet l daribe
  }
  double get netSalary{
    return gross - taxAmount - deductions ;//hon bdna nhsob l m3ach li ha ydal baad l taxAmount w deductions(eiza fi khsumat zyede gheir l daribe)
  }
  @override
  String toString() {
    return "Net Salary : \$ ${netSalary.toStringAsFixed(2)}\n "
    "Gross Salary : \$ ${gross.toStringAsFixed(2)}     Tax: \$ ${taxAmount.toStringAsFixed(2)} ";
  }

}