module DesignPattern
  module Iobserver
    module Subject
      def initialize
        @observers=[]
      end

      def add_observer(observer)
        @observers << observer
      end

      def delete_observer(observer)
        @observers.delete(observer)
      end

      def notify_observers
        @observers.each do |observer|
          observer.update(self)
        end
      end
    end

    module Subject01
      def initialize
        @observers=[]
      end

      def add_observer(&observer)
        @observers << observer
      end

      def delete_observer(observer)
        @observers.delete(observer)
      end

      def notify_observers
        @observers.each do |observer|
          observer.call(self)
        end
      end
    end
  end
end