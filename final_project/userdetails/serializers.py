from rest_framework import serializers
from userdetails.models import Company,Designation, Payroll, ApplicationType, Application


class CompanySerializer(serializers.HyperlinkedModelSerializer):
    company_id = serializers.ReadOnlyField()

    class Meta:
        model = Company
        fields= "__all__"
    def validate_phone(self, value):
        if value < 9000000000 or value > 9999999999:
            raise serializers.ValidationError('wrong format')
        return value

class DesignationSerializer (serializers.HyperlinkedModelSerializer):
    designation_id = serializers.ReadOnlyField()

    class Meta:
        model = Designation
        fields= "__all__"


class PayrollSerializer (serializers.ModelSerializer):
    class Meta:
        model = Payroll
        fields= "__all__"
        read_only_fields =['salary','tax_amount','gross_salary','net_salary']

    def get_designation(self, obj):
        print("---------------------------",obj)
        if obj.designation:
            # designation= Designation.objects.get(designation_id=obj.designation)
            return obj.designation.designation_id
        return None



class ApplicationTypeSerializer (serializers.HyperlinkedModelSerializer):
    Applicationtype_id = serializers.ReadOnlyField()
    
    class Meta:
        model = ApplicationType
        fields= "__all__"


class ApplicationSerializer (serializers.ModelSerializer):
    Application_id = serializers.ReadOnlyField()
    def validate_for_days(self, value):
        if value < 1:
            raise serializers.ValidationError('Invalid Number of Days')
        elif value > 4:
            raise serializers.ValidationError('For more than 4 days of leave, please contact the Office directly. Thank you')
        return value
    class Meta:
        model = Application
        fields= "__all__"