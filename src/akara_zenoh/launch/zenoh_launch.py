from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='zenoh_bridge_ros2dds',
            executable='zenoh_bridge_ros2dds',
            name='zenoh_bridge_ros2dds',
            emulate_tty=True,
        )
    ])
