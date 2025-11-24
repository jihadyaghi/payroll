class Payroll{
  double _hoursWorked ;
  double _hourlyRate ;
  double _taxPercent;
  double _deductions;
  Payroll(this._hoursWorked , this._hourlyRate , this._taxPercent , this._deductions){
    if (_hoursWorked < 0){
      throw ArgumentError("Hours worked must be >=0");
    }
    if (_hourlyRate < 0){
      throw ArgumentError("Hourly Rate must be >=0");
    }
    if (_taxPercent <0 || _taxPercent>100){
      throw ArgumentError("Hours worked must be between 0 and 100");
    }
    if (_deductions< 0){
      throw ArgumentError("Deductions must be >=0");
    }
  }
  

  
  double get hoursWorked => _hoursWorked ;
  double get hourlyRate => _hourlyRate ;
  double get taxPercent => _taxPercent ;
  double get deductions => _deductions;
  double get gross=>hoursWorked * hourlyRate ;//bytla3lna edeh m3achu 
  
  double get taxAmount=> gross * (taxPercent/100);//edeh ha tkun 2imet l daribe
  
  double get netSalary=> gross - taxAmount - deductions ;//hon bdna nhsob l m3ach li ha ydal baad l taxAmount w deductions(eiza fi khsumat zyede gheir l daribe)
  
  @override
  String toString() {
    return "Net Salary : \$ ${netSalary.toStringAsFixed(2)}\n "
    "Gross Salary : \$ ${gross.toStringAsFixed(2)}     Tax: \$ ${taxAmount.toStringAsFixed(2)} ";
  }

}